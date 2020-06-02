#if __GNUC__
    #define SECTION(sectionname) __attribute__((section(sectionname)))

    //initdata
    #define QCHAR char SECTION(".sysinitdata")

    //initcode
    #define QVOID void SECTION(".initcode")
    #define QUINT unsigned int SECTION(".initcode")

    //boot sign
    #define BOOTABLE unsigned int SECTION(".bootflag") flag = 0xAA550000;


#endif

