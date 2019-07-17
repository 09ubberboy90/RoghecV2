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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Roghec_Main.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Roghec_Main.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=src/pwm.c src/i2c.c src/io.c src/gyroscope.c src/servo.c src/usart.c src/usb/usb_descriptors.c src/usb/usb_device.c src/usb/usb_device_cdc.c src/usb/usb_events.c src/main.c src/system.c src/motor.c src/interupts.c src/pid.c src/io_controller.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/pwm.p1 ${OBJECTDIR}/src/i2c.p1 ${OBJECTDIR}/src/io.p1 ${OBJECTDIR}/src/gyroscope.p1 ${OBJECTDIR}/src/servo.p1 ${OBJECTDIR}/src/usart.p1 ${OBJECTDIR}/src/usb/usb_descriptors.p1 ${OBJECTDIR}/src/usb/usb_device.p1 ${OBJECTDIR}/src/usb/usb_device_cdc.p1 ${OBJECTDIR}/src/usb/usb_events.p1 ${OBJECTDIR}/src/main.p1 ${OBJECTDIR}/src/system.p1 ${OBJECTDIR}/src/motor.p1 ${OBJECTDIR}/src/interupts.p1 ${OBJECTDIR}/src/pid.p1 ${OBJECTDIR}/src/io_controller.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/src/pwm.p1.d ${OBJECTDIR}/src/i2c.p1.d ${OBJECTDIR}/src/io.p1.d ${OBJECTDIR}/src/gyroscope.p1.d ${OBJECTDIR}/src/servo.p1.d ${OBJECTDIR}/src/usart.p1.d ${OBJECTDIR}/src/usb/usb_descriptors.p1.d ${OBJECTDIR}/src/usb/usb_device.p1.d ${OBJECTDIR}/src/usb/usb_device_cdc.p1.d ${OBJECTDIR}/src/usb/usb_events.p1.d ${OBJECTDIR}/src/main.p1.d ${OBJECTDIR}/src/system.p1.d ${OBJECTDIR}/src/motor.p1.d ${OBJECTDIR}/src/interupts.p1.d ${OBJECTDIR}/src/pid.p1.d ${OBJECTDIR}/src/io_controller.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/pwm.p1 ${OBJECTDIR}/src/i2c.p1 ${OBJECTDIR}/src/io.p1 ${OBJECTDIR}/src/gyroscope.p1 ${OBJECTDIR}/src/servo.p1 ${OBJECTDIR}/src/usart.p1 ${OBJECTDIR}/src/usb/usb_descriptors.p1 ${OBJECTDIR}/src/usb/usb_device.p1 ${OBJECTDIR}/src/usb/usb_device_cdc.p1 ${OBJECTDIR}/src/usb/usb_events.p1 ${OBJECTDIR}/src/main.p1 ${OBJECTDIR}/src/system.p1 ${OBJECTDIR}/src/motor.p1 ${OBJECTDIR}/src/interupts.p1 ${OBJECTDIR}/src/pid.p1 ${OBJECTDIR}/src/io_controller.p1

# Source Files
SOURCEFILES=src/pwm.c src/i2c.c src/io.c src/gyroscope.c src/servo.c src/usart.c src/usb/usb_descriptors.c src/usb/usb_device.c src/usb/usb_device_cdc.c src/usb/usb_events.c src/main.c src/system.c src/motor.c src/interupts.c src/pid.c src/io_controller.c


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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Roghec_Main.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F45K50
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/pwm.p1: src/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/pwm.p1.d 
	@${RM} ${OBJECTDIR}/src/pwm.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/pwm.p1 src/pwm.c 
	@-${MV} ${OBJECTDIR}/src/pwm.d ${OBJECTDIR}/src/pwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/pwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/i2c.p1: src/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/i2c.p1.d 
	@${RM} ${OBJECTDIR}/src/i2c.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/i2c.p1 src/i2c.c 
	@-${MV} ${OBJECTDIR}/src/i2c.d ${OBJECTDIR}/src/i2c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/i2c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/io.p1: src/io.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/io.p1.d 
	@${RM} ${OBJECTDIR}/src/io.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/io.p1 src/io.c 
	@-${MV} ${OBJECTDIR}/src/io.d ${OBJECTDIR}/src/io.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/io.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/gyroscope.p1: src/gyroscope.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/gyroscope.p1.d 
	@${RM} ${OBJECTDIR}/src/gyroscope.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/gyroscope.p1 src/gyroscope.c 
	@-${MV} ${OBJECTDIR}/src/gyroscope.d ${OBJECTDIR}/src/gyroscope.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/gyroscope.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/servo.p1: src/servo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/servo.p1.d 
	@${RM} ${OBJECTDIR}/src/servo.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/servo.p1 src/servo.c 
	@-${MV} ${OBJECTDIR}/src/servo.d ${OBJECTDIR}/src/servo.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/servo.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/usart.p1: src/usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/usart.p1.d 
	@${RM} ${OBJECTDIR}/src/usart.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/usart.p1 src/usart.c 
	@-${MV} ${OBJECTDIR}/src/usart.d ${OBJECTDIR}/src/usart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/usart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/usb/usb_descriptors.p1: src/usb/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/usb" 
	@${RM} ${OBJECTDIR}/src/usb/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/src/usb/usb_descriptors.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/usb/usb_descriptors.p1 src/usb/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/src/usb/usb_descriptors.d ${OBJECTDIR}/src/usb/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/usb/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/usb/usb_device.p1: src/usb/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/usb" 
	@${RM} ${OBJECTDIR}/src/usb/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/src/usb/usb_device.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/usb/usb_device.p1 src/usb/usb_device.c 
	@-${MV} ${OBJECTDIR}/src/usb/usb_device.d ${OBJECTDIR}/src/usb/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/usb/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/usb/usb_device_cdc.p1: src/usb/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/usb" 
	@${RM} ${OBJECTDIR}/src/usb/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/src/usb/usb_device_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/usb/usb_device_cdc.p1 src/usb/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/src/usb/usb_device_cdc.d ${OBJECTDIR}/src/usb/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/usb/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/usb/usb_events.p1: src/usb/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/usb" 
	@${RM} ${OBJECTDIR}/src/usb/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/src/usb/usb_events.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/usb/usb_events.p1 src/usb/usb_events.c 
	@-${MV} ${OBJECTDIR}/src/usb/usb_events.d ${OBJECTDIR}/src/usb/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/usb/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/main.p1: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.p1.d 
	@${RM} ${OBJECTDIR}/src/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/main.p1 src/main.c 
	@-${MV} ${OBJECTDIR}/src/main.d ${OBJECTDIR}/src/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/system.p1: src/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/system.p1.d 
	@${RM} ${OBJECTDIR}/src/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/system.p1 src/system.c 
	@-${MV} ${OBJECTDIR}/src/system.d ${OBJECTDIR}/src/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/motor.p1: src/motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/motor.p1.d 
	@${RM} ${OBJECTDIR}/src/motor.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/motor.p1 src/motor.c 
	@-${MV} ${OBJECTDIR}/src/motor.d ${OBJECTDIR}/src/motor.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/motor.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/interupts.p1: src/interupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/interupts.p1.d 
	@${RM} ${OBJECTDIR}/src/interupts.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/interupts.p1 src/interupts.c 
	@-${MV} ${OBJECTDIR}/src/interupts.d ${OBJECTDIR}/src/interupts.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/interupts.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/pid.p1: src/pid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/pid.p1.d 
	@${RM} ${OBJECTDIR}/src/pid.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/pid.p1 src/pid.c 
	@-${MV} ${OBJECTDIR}/src/pid.d ${OBJECTDIR}/src/pid.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/pid.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/io_controller.p1: src/io_controller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/io_controller.p1.d 
	@${RM} ${OBJECTDIR}/src/io_controller.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/io_controller.p1 src/io_controller.c 
	@-${MV} ${OBJECTDIR}/src/io_controller.d ${OBJECTDIR}/src/io_controller.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/io_controller.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/src/pwm.p1: src/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/pwm.p1.d 
	@${RM} ${OBJECTDIR}/src/pwm.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/pwm.p1 src/pwm.c 
	@-${MV} ${OBJECTDIR}/src/pwm.d ${OBJECTDIR}/src/pwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/pwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/i2c.p1: src/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/i2c.p1.d 
	@${RM} ${OBJECTDIR}/src/i2c.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/i2c.p1 src/i2c.c 
	@-${MV} ${OBJECTDIR}/src/i2c.d ${OBJECTDIR}/src/i2c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/i2c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/io.p1: src/io.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/io.p1.d 
	@${RM} ${OBJECTDIR}/src/io.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/io.p1 src/io.c 
	@-${MV} ${OBJECTDIR}/src/io.d ${OBJECTDIR}/src/io.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/io.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/gyroscope.p1: src/gyroscope.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/gyroscope.p1.d 
	@${RM} ${OBJECTDIR}/src/gyroscope.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/gyroscope.p1 src/gyroscope.c 
	@-${MV} ${OBJECTDIR}/src/gyroscope.d ${OBJECTDIR}/src/gyroscope.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/gyroscope.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/servo.p1: src/servo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/servo.p1.d 
	@${RM} ${OBJECTDIR}/src/servo.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/servo.p1 src/servo.c 
	@-${MV} ${OBJECTDIR}/src/servo.d ${OBJECTDIR}/src/servo.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/servo.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/usart.p1: src/usart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/usart.p1.d 
	@${RM} ${OBJECTDIR}/src/usart.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/usart.p1 src/usart.c 
	@-${MV} ${OBJECTDIR}/src/usart.d ${OBJECTDIR}/src/usart.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/usart.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/usb/usb_descriptors.p1: src/usb/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/usb" 
	@${RM} ${OBJECTDIR}/src/usb/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/src/usb/usb_descriptors.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/usb/usb_descriptors.p1 src/usb/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/src/usb/usb_descriptors.d ${OBJECTDIR}/src/usb/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/usb/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/usb/usb_device.p1: src/usb/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/usb" 
	@${RM} ${OBJECTDIR}/src/usb/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/src/usb/usb_device.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/usb/usb_device.p1 src/usb/usb_device.c 
	@-${MV} ${OBJECTDIR}/src/usb/usb_device.d ${OBJECTDIR}/src/usb/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/usb/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/usb/usb_device_cdc.p1: src/usb/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/usb" 
	@${RM} ${OBJECTDIR}/src/usb/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/src/usb/usb_device_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/usb/usb_device_cdc.p1 src/usb/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/src/usb/usb_device_cdc.d ${OBJECTDIR}/src/usb/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/usb/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/usb/usb_events.p1: src/usb/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/usb" 
	@${RM} ${OBJECTDIR}/src/usb/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/src/usb/usb_events.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/usb/usb_events.p1 src/usb/usb_events.c 
	@-${MV} ${OBJECTDIR}/src/usb/usb_events.d ${OBJECTDIR}/src/usb/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/usb/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/main.p1: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.p1.d 
	@${RM} ${OBJECTDIR}/src/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/main.p1 src/main.c 
	@-${MV} ${OBJECTDIR}/src/main.d ${OBJECTDIR}/src/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/system.p1: src/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/system.p1.d 
	@${RM} ${OBJECTDIR}/src/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/system.p1 src/system.c 
	@-${MV} ${OBJECTDIR}/src/system.d ${OBJECTDIR}/src/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/motor.p1: src/motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/motor.p1.d 
	@${RM} ${OBJECTDIR}/src/motor.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/motor.p1 src/motor.c 
	@-${MV} ${OBJECTDIR}/src/motor.d ${OBJECTDIR}/src/motor.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/motor.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/interupts.p1: src/interupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/interupts.p1.d 
	@${RM} ${OBJECTDIR}/src/interupts.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/interupts.p1 src/interupts.c 
	@-${MV} ${OBJECTDIR}/src/interupts.d ${OBJECTDIR}/src/interupts.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/interupts.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/pid.p1: src/pid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/pid.p1.d 
	@${RM} ${OBJECTDIR}/src/pid.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/pid.p1 src/pid.c 
	@-${MV} ${OBJECTDIR}/src/pid.d ${OBJECTDIR}/src/pid.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/pid.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/src/io_controller.p1: src/io_controller.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/io_controller.p1.d 
	@${RM} ${OBJECTDIR}/src/io_controller.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/src/io_controller.p1 src/io_controller.c 
	@-${MV} ${OBJECTDIR}/src/io_controller.d ${OBJECTDIR}/src/io_controller.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/src/io_controller.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
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
dist/${CND_CONF}/${IMAGE_TYPE}/Roghec_Main.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/Roghec_Main.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/Roghec_Main.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/Roghec_Main.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Roghec_Main.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/Roghec_Main.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/Roghec_Main.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
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
