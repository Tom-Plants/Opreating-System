%include "../header/common/asm/pm.inc"

extern _boot_main
global _GDT_CODE
global _GDT_MEM

sysmain equ 0x7c00+_boot_main

[section .preinitcode align=16]
[bits 16]

    xor ax, ax
    mov ds, ax

    mov ax, 0x07c0
    mov ss, ax
    mov sp, 0x200

    lgdt [GDT_LOADER]

    mov al, 0x06
    mov dx, 0x03CE
    out dx, al
    inc dx
    in al, dx
    and al, 0b11110011
    out dx, al

    cli

    in al, 0x92
    or al, 2
    out 0x92, al

    mov eax, cr0
    or eax, 1
    mov cr0, eax

    mov ax, 0x10
    mov ds, ax
    mov ax, 0x18
    mov ss, ax
    jmp dword 0x8:pre_boot_main

[BITS 32]
pre_boot_main:
    mov esp, 0x7e00
    mov ebp, esp
    call _boot_main
    jmp $

GDT_START: Descriptor 0, 0, 0
_GDT_CODE: Descriptor 0x0, 0xFFFFF, DA_32 + DA_C | 0x8000
_GDT_MEM: Descriptor 0x0, 0xFFFFF, DA_DRW | 0x8000
_GDT_STACK: Descriptor 0x0, 0xFFFFF, DA_DRWA + DA_32 | 0x8000
GDTLENGTH equ $-GDT_START
GDT_LOADER: dw GDTLENGTH
            dd GDT_START