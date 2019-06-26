#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RoghecV2.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RoghecV2.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=D:/Personal/FinalTest/Final_Test/RoghecV2/src/pwm.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/i2c.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/io.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/gyroscope.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/servo.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_descriptors.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_device.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_device_cdc.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_events.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/main.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/system.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/motor.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/interupts.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/pid.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/io_controller.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/usart.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/2141126742/pwm.p1 ${OBJECTDIR}/_ext/2141126742/i2c.p1 ${OBJECTDIR}/_ext/2141126742/io.p1 ${OBJECTDIR}/_ext/2141126742/gyroscope.p1 ${OBJECTDIR}/_ext/2141126742/servo.p1 ${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1 ${OBJECTDIR}/_ext/1661859765/usb_device.p1 ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1 ${OBJECTDIR}/_ext/1661859765/usb_events.p1 ${OBJECTDIR}/_ext/2141126742/main.p1 ${OBJECTDIR}/_ext/2141126742/system.p1 ${OBJECTDIR}/_ext/2141126742/motor.p1 ${OBJECTDIR}/_ext/2141126742/interupts.p1 ${OBJECTDIR}/_ext/2141126742/pid.p1 ${OBJECTDIR}/_ext/2141126742/io_controller.p1 ${OBJECTDIR}/_ext/2141126742/usart.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/2141126742/pwm.p1.d ${OBJECTDIR}/_ext/2141126742/i2c.p1.d ${OBJECTDIR}/_ext/2141126742/io.p1.d ${OBJECTDIR}/_ext/2141126742/gyroscope.p1.d ${OBJECTDIR}/_ext/2141126742/servo.p1.d ${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1.d ${OBJECTDIR}/_ext/1661859765/usb_device.p1.d ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1.d ${OBJECTDIR}/_ext/1661859765/usb_events.p1.d ${OBJECTDIR}/_ext/2141126742/main.p1.d ${OBJECTDIR}/_ext/2141126742/system.p1.d ${OBJECTDIR}/_ext/2141126742/motor.p1.d ${OBJECTDIR}/_ext/2141126742/interupts.p1.d ${OBJECTDIR}/_ext/2141126742/pid.p1.d ${OBJECTDIR}/_ext/2141126742/io_controller.p1.d ${OBJECTDIR}/_ext/2141126742/usart.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/2141126742/pwm.p1 ${OBJECTDIR}/_ext/2141126742/i2c.p1 ${OBJECTDIR}/_ext/2141126742/io.p1 ${OBJECTDIR}/_ext/2141126742/gyroscope.p1 ${OBJECTDIR}/_ext/2141126742/servo.p1 ${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1 ${OBJECTDIR}/_ext/1661859765/usb_device.p1 ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1 ${OBJECTDIR}/_ext/1661859765/usb_events.p1 ${OBJECTDIR}/_ext/2141126742/main.p1 ${OBJECTDIR}/_ext/2141126742/system.p1 ${OBJECTDIR}/_ext/2141126742/motor.p1 ${OBJECTDIR}/_ext/2141126742/interupts.p1 ${OBJECTDIR}/_ext/2141126742/pid.p1 ${OBJECTDIR}/_ext/2141126742/io_controller.p1 ${OBJECTDIR}/_ext/2141126742/usart.p1

# Source Files
SOURCEFILES=D:/Personal/FinalTest/Final_Test/RoghecV2/src/pwm.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/i2c.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/io.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/gyroscope.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/servo.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_descriptors.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_device.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_device_cdc.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_events.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/main.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/system.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/motor.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/interupts.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/pid.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/io_controller.c D:/Personal/FinalTest/Final_Test/RoghecV2/src/usart.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/RoghecV2.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F45K50
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/2141126742/pwm.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/pwm.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/pwm.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/pwm.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/pwm.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/pwm.d ${OBJECTDIR}/_ext/2141126742/pwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/pwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/i2c.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/i2c.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/i2c.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/i2c.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/i2c.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/i2c.d ${OBJECTDIR}/_ext/2141126742/i2c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/i2c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/io.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/io.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/io.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/io.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/io.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/io.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/io.d ${OBJECTDIR}/_ext/2141126742/io.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/io.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/gyroscope.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/gyroscope.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/gyroscope.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/gyroscope.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/gyroscope.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/gyroscope.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/gyroscope.d ${OBJECTDIR}/_ext/2141126742/gyroscope.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/gyroscope.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/servo.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/servo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/servo.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/servo.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/servo.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/servo.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/servo.d ${OBJECTDIR}/_ext/2141126742/servo.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/servo.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1661859765" 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/1661859765/usb_descriptors.d ${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1661859765/usb_device.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1661859765" 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_device.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1661859765/usb_device.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/1661859765/usb_device.d ${OBJECTDIR}/_ext/1661859765/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1661859765/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1661859765" 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.d ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1661859765/usb_events.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1661859765" 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_events.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1661859765/usb_events.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/1661859765/usb_events.d ${OBJECTDIR}/_ext/1661859765/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1661859765/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/main.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/main.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/main.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/main.d ${OBJECTDIR}/_ext/2141126742/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/system.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/system.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/system.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/system.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/system.d ${OBJECTDIR}/_ext/2141126742/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/motor.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/motor.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/motor.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/motor.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/motor.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/motor.d ${OBJECTDIR}/_ext/2141126742/motor.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/motor.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/interupts.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/interupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/interupts.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/interupts.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/interupts.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/interupts.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/interupts.d ${OBJECTDIR}/_ext/2141126742/interupts.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/interupts.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/pid.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/pid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/pid.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/pid.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/pid.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/pid.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/pid.d ${OBJECTDIR}/_ext/2141126742/pid.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/pid.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/io_controller.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/io_controller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/io_controller.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/io_controller.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/io_controller.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/io_controller.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/io_controller.d ${OBJECTDIR}/_ext/2141126742/io_controller.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/io_controller.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/usart.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/usart.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/usart.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/usart.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/usart.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/usart.d ${OBJECTDIR}/_ext/2141126742/usart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/usart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/usart.p1: D:/Personal/FinalTest/Final_Test.X/src/usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/usart.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/usart.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/usart.p1 D:/Personal/FinalTest/Final_Test.X/src/usart.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/usart.d ${OBJECTDIR}/_ext/448146715/usart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/usart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/io_controller.p1: D:/Personal/FinalTest/Final_Test.X/src/io_controller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/io_controller.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/io_controller.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/io_controller.p1 D:/Personal/FinalTest/Final_Test.X/src/io_controller.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/io_controller.d ${OBJECTDIR}/_ext/448146715/io_controller.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/io_controller.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/2141126742/pwm.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/pwm.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/pwm.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/pwm.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/pwm.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/pwm.d ${OBJECTDIR}/_ext/2141126742/pwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/pwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/i2c.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/i2c.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/i2c.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/i2c.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/i2c.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/i2c.d ${OBJECTDIR}/_ext/2141126742/i2c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/i2c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/io.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/io.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/io.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/io.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/io.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/io.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/io.d ${OBJECTDIR}/_ext/2141126742/io.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/io.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/gyroscope.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/gyroscope.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/gyroscope.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/gyroscope.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/gyroscope.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/gyroscope.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/gyroscope.d ${OBJECTDIR}/_ext/2141126742/gyroscope.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/gyroscope.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/servo.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/servo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/servo.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/servo.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/servo.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/servo.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/servo.d ${OBJECTDIR}/_ext/2141126742/servo.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/servo.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1661859765" 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/1661859765/usb_descriptors.d ${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1661859765/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1661859765/usb_device.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1661859765" 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_device.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1661859765/usb_device.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/1661859765/usb_device.d ${OBJECTDIR}/_ext/1661859765/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1661859765/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1661859765" 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.d ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1661859765/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1661859765/usb_events.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1661859765" 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1661859765/usb_events.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1661859765/usb_events.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/usb/usb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/1661859765/usb_events.d ${OBJECTDIR}/_ext/1661859765/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1661859765/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/main.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/main.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/main.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/main.d ${OBJECTDIR}/_ext/2141126742/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/system.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/system.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/system.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/system.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/system.d ${OBJECTDIR}/_ext/2141126742/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/motor.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/motor.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/motor.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/motor.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/motor.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/motor.d ${OBJECTDIR}/_ext/2141126742/motor.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/motor.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/interupts.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/interupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/interupts.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/interupts.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/interupts.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/interupts.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/interupts.d ${OBJECTDIR}/_ext/2141126742/interupts.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/interupts.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/pid.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/pid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/pid.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/pid.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/pid.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/pid.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/pid.d ${OBJECTDIR}/_ext/2141126742/pid.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/pid.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/io_controller.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/io_controller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/io_controller.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/io_controller.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/io_controller.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/io_controller.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/io_controller.d ${OBJECTDIR}/_ext/2141126742/io_controller.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/io_controller.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2141126742/usart.p1: D:/Personal/FinalTest/Final_Test/RoghecV2/src/usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2141126742" 
	@${RM} ${OBJECTDIR}/_ext/2141126742/usart.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2141126742/usart.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/2141126742/usart.p1 D:/Personal/FinalTest/Final_Test/RoghecV2/src/usart.c 
	@-${MV} ${OBJECTDIR}/_ext/2141126742/usart.d ${OBJECTDIR}/_ext/2141126742/usart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2141126742/usart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/usart.p1: D:/Personal/FinalTest/Final_Test.X/src/usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/usart.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/usart.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/usart.p1 D:/Personal/FinalTest/Final_Test.X/src/usart.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/usart.d ${OBJECTDIR}/_ext/448146715/usart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/usart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/io_controller.p1: D:/Personal/FinalTest/Final_Test.X/src/io_controller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/io_controller.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/io_controller.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/io_controller.p1 D:/Personal/FinalTest/Final_Test.X/src/io_controller.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/io_controller.d ${OBJECTDIR}/_ext/448146715/io_controller.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/io_controller.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/RoghecV2.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/RoghecV2.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/RoghecV2.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/RoghecV2.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/RoghecV2.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/RoghecV2.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/RoghecV2.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
