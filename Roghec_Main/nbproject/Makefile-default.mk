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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Final_Test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Final_Test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=D:/Personal/FinalTest/Final_Test.X/src/adc.c D:/Personal/FinalTest/Final_Test.X/src/buttons.c D:/Personal/FinalTest/Final_Test.X/src/magnetometer.c D:/Personal/FinalTest/Final_Test.X/src/pwm.c D:/Personal/FinalTest/Final_Test.X/src/i2c.c D:/Personal/FinalTest/Final_Test.X/src/io.c D:/Personal/FinalTest/Final_Test.X/src/gyroscope.c D:/Personal/FinalTest/Final_Test.X/src/usb/usb_descriptors.c D:/Personal/FinalTest/Final_Test.X/src/usb/usb_device.c D:/Personal/FinalTest/Final_Test.X/src/usb/usb_device_cdc.c D:/Personal/FinalTest/Final_Test.X/src/usb/usb_events.c D:/Personal/FinalTest/Final_Test.X/src/app_device_cdc_basic.c D:/Personal/FinalTest/Final_Test.X/src/main.c D:/Personal/FinalTest/Final_Test.X/src/system.c D:/Personal/FinalTest/Final_Test.X/src/motor.c D:/Personal/FinalTest/Final_Test.X/src/app_led_usb_status.c D:/Personal/FinalTest/Final_Test.X/src/interupts.c D:/Personal/FinalTest/Final_Test.X/src/servo.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/448146715/adc.p1 ${OBJECTDIR}/_ext/448146715/buttons.p1 ${OBJECTDIR}/_ext/448146715/magnetometer.p1 ${OBJECTDIR}/_ext/448146715/pwm.p1 ${OBJECTDIR}/_ext/448146715/i2c.p1 ${OBJECTDIR}/_ext/448146715/io.p1 ${OBJECTDIR}/_ext/448146715/gyroscope.p1 ${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1 ${OBJECTDIR}/_ext/1262290086/usb_device.p1 ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1 ${OBJECTDIR}/_ext/1262290086/usb_events.p1 ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1 ${OBJECTDIR}/_ext/448146715/main.p1 ${OBJECTDIR}/_ext/448146715/system.p1 ${OBJECTDIR}/_ext/448146715/motor.p1 ${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1 ${OBJECTDIR}/_ext/448146715/interupts.p1 ${OBJECTDIR}/_ext/448146715/servo.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/448146715/adc.p1.d ${OBJECTDIR}/_ext/448146715/buttons.p1.d ${OBJECTDIR}/_ext/448146715/magnetometer.p1.d ${OBJECTDIR}/_ext/448146715/pwm.p1.d ${OBJECTDIR}/_ext/448146715/i2c.p1.d ${OBJECTDIR}/_ext/448146715/io.p1.d ${OBJECTDIR}/_ext/448146715/gyroscope.p1.d ${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1.d ${OBJECTDIR}/_ext/1262290086/usb_device.p1.d ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1.d ${OBJECTDIR}/_ext/1262290086/usb_events.p1.d ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1.d ${OBJECTDIR}/_ext/448146715/main.p1.d ${OBJECTDIR}/_ext/448146715/system.p1.d ${OBJECTDIR}/_ext/448146715/motor.p1.d ${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1.d ${OBJECTDIR}/_ext/448146715/interupts.p1.d ${OBJECTDIR}/_ext/448146715/servo.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/448146715/adc.p1 ${OBJECTDIR}/_ext/448146715/buttons.p1 ${OBJECTDIR}/_ext/448146715/magnetometer.p1 ${OBJECTDIR}/_ext/448146715/pwm.p1 ${OBJECTDIR}/_ext/448146715/i2c.p1 ${OBJECTDIR}/_ext/448146715/io.p1 ${OBJECTDIR}/_ext/448146715/gyroscope.p1 ${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1 ${OBJECTDIR}/_ext/1262290086/usb_device.p1 ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1 ${OBJECTDIR}/_ext/1262290086/usb_events.p1 ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1 ${OBJECTDIR}/_ext/448146715/main.p1 ${OBJECTDIR}/_ext/448146715/system.p1 ${OBJECTDIR}/_ext/448146715/motor.p1 ${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1 ${OBJECTDIR}/_ext/448146715/interupts.p1 ${OBJECTDIR}/_ext/448146715/servo.p1

# Source Files
SOURCEFILES=D:/Personal/FinalTest/Final_Test.X/src/adc.c D:/Personal/FinalTest/Final_Test.X/src/buttons.c D:/Personal/FinalTest/Final_Test.X/src/magnetometer.c D:/Personal/FinalTest/Final_Test.X/src/pwm.c D:/Personal/FinalTest/Final_Test.X/src/i2c.c D:/Personal/FinalTest/Final_Test.X/src/io.c D:/Personal/FinalTest/Final_Test.X/src/gyroscope.c D:/Personal/FinalTest/Final_Test.X/src/usb/usb_descriptors.c D:/Personal/FinalTest/Final_Test.X/src/usb/usb_device.c D:/Personal/FinalTest/Final_Test.X/src/usb/usb_device_cdc.c D:/Personal/FinalTest/Final_Test.X/src/usb/usb_events.c D:/Personal/FinalTest/Final_Test.X/src/app_device_cdc_basic.c D:/Personal/FinalTest/Final_Test.X/src/main.c D:/Personal/FinalTest/Final_Test.X/src/system.c D:/Personal/FinalTest/Final_Test.X/src/motor.c D:/Personal/FinalTest/Final_Test.X/src/app_led_usb_status.c D:/Personal/FinalTest/Final_Test.X/src/interupts.c D:/Personal/FinalTest/Final_Test.X/src/servo.c


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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Final_Test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F45K50
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/448146715/adc.p1: D:/Personal/FinalTest/Final_Test.X/src/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/adc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/adc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/adc.p1 D:/Personal/FinalTest/Final_Test.X/src/adc.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/adc.d ${OBJECTDIR}/_ext/448146715/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/buttons.p1: D:/Personal/FinalTest/Final_Test.X/src/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/buttons.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/buttons.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/buttons.p1 D:/Personal/FinalTest/Final_Test.X/src/buttons.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/buttons.d ${OBJECTDIR}/_ext/448146715/buttons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/buttons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/magnetometer.p1: D:/Personal/FinalTest/Final_Test.X/src/magnetometer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/magnetometer.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/magnetometer.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/magnetometer.p1 D:/Personal/FinalTest/Final_Test.X/src/magnetometer.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/magnetometer.d ${OBJECTDIR}/_ext/448146715/magnetometer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/magnetometer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/pwm.p1: D:/Personal/FinalTest/Final_Test.X/src/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/pwm.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/pwm.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/pwm.p1 D:/Personal/FinalTest/Final_Test.X/src/pwm.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/pwm.d ${OBJECTDIR}/_ext/448146715/pwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/pwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/i2c.p1: D:/Personal/FinalTest/Final_Test.X/src/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/i2c.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/i2c.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/i2c.p1 D:/Personal/FinalTest/Final_Test.X/src/i2c.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/i2c.d ${OBJECTDIR}/_ext/448146715/i2c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/i2c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/io.p1: D:/Personal/FinalTest/Final_Test.X/src/io.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/io.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/io.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/io.p1 D:/Personal/FinalTest/Final_Test.X/src/io.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/io.d ${OBJECTDIR}/_ext/448146715/io.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/io.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/gyroscope.p1: D:/Personal/FinalTest/Final_Test.X/src/gyroscope.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/gyroscope.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/gyroscope.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/gyroscope.p1 D:/Personal/FinalTest/Final_Test.X/src/gyroscope.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/gyroscope.d ${OBJECTDIR}/_ext/448146715/gyroscope.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/gyroscope.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1: D:/Personal/FinalTest/Final_Test.X/src/usb/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1262290086" 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1 D:/Personal/FinalTest/Final_Test.X/src/usb/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/1262290086/usb_descriptors.d ${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1262290086/usb_device.p1: D:/Personal/FinalTest/Final_Test.X/src/usb/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1262290086" 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_device.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1262290086/usb_device.p1 D:/Personal/FinalTest/Final_Test.X/src/usb/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/1262290086/usb_device.d ${OBJECTDIR}/_ext/1262290086/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1262290086/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1: D:/Personal/FinalTest/Final_Test.X/src/usb/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1262290086" 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1 D:/Personal/FinalTest/Final_Test.X/src/usb/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.d ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1262290086/usb_events.p1: D:/Personal/FinalTest/Final_Test.X/src/usb/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1262290086" 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_events.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1262290086/usb_events.p1 D:/Personal/FinalTest/Final_Test.X/src/usb/usb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/1262290086/usb_events.d ${OBJECTDIR}/_ext/1262290086/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1262290086/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1: D:/Personal/FinalTest/Final_Test.X/src/app_device_cdc_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1 D:/Personal/FinalTest/Final_Test.X/src/app_device_cdc_basic.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.d ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/main.p1: D:/Personal/FinalTest/Final_Test.X/src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/main.p1 D:/Personal/FinalTest/Final_Test.X/src/main.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/main.d ${OBJECTDIR}/_ext/448146715/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/system.p1: D:/Personal/FinalTest/Final_Test.X/src/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/system.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/system.p1 D:/Personal/FinalTest/Final_Test.X/src/system.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/system.d ${OBJECTDIR}/_ext/448146715/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/motor.p1: D:/Personal/FinalTest/Final_Test.X/src/motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/motor.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/motor.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/motor.p1 D:/Personal/FinalTest/Final_Test.X/src/motor.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/motor.d ${OBJECTDIR}/_ext/448146715/motor.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/motor.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1: D:/Personal/FinalTest/Final_Test.X/src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1 D:/Personal/FinalTest/Final_Test.X/src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/app_led_usb_status.d ${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/interupts.p1: D:/Personal/FinalTest/Final_Test.X/src/interupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/interupts.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/interupts.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/interupts.p1 D:/Personal/FinalTest/Final_Test.X/src/interupts.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/interupts.d ${OBJECTDIR}/_ext/448146715/interupts.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/interupts.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/servo.p1: D:/Personal/FinalTest/Final_Test.X/src/servo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/servo.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/servo.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/servo.p1 D:/Personal/FinalTest/Final_Test.X/src/servo.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/servo.d ${OBJECTDIR}/_ext/448146715/servo.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/servo.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/448146715/adc.p1: D:/Personal/FinalTest/Final_Test.X/src/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/adc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/adc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/adc.p1 D:/Personal/FinalTest/Final_Test.X/src/adc.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/adc.d ${OBJECTDIR}/_ext/448146715/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/buttons.p1: D:/Personal/FinalTest/Final_Test.X/src/buttons.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/buttons.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/buttons.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/buttons.p1 D:/Personal/FinalTest/Final_Test.X/src/buttons.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/buttons.d ${OBJECTDIR}/_ext/448146715/buttons.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/buttons.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/magnetometer.p1: D:/Personal/FinalTest/Final_Test.X/src/magnetometer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/magnetometer.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/magnetometer.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/magnetometer.p1 D:/Personal/FinalTest/Final_Test.X/src/magnetometer.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/magnetometer.d ${OBJECTDIR}/_ext/448146715/magnetometer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/magnetometer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/pwm.p1: D:/Personal/FinalTest/Final_Test.X/src/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/pwm.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/pwm.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/pwm.p1 D:/Personal/FinalTest/Final_Test.X/src/pwm.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/pwm.d ${OBJECTDIR}/_ext/448146715/pwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/pwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/i2c.p1: D:/Personal/FinalTest/Final_Test.X/src/i2c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/i2c.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/i2c.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/i2c.p1 D:/Personal/FinalTest/Final_Test.X/src/i2c.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/i2c.d ${OBJECTDIR}/_ext/448146715/i2c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/i2c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/io.p1: D:/Personal/FinalTest/Final_Test.X/src/io.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/io.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/io.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/io.p1 D:/Personal/FinalTest/Final_Test.X/src/io.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/io.d ${OBJECTDIR}/_ext/448146715/io.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/io.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/gyroscope.p1: D:/Personal/FinalTest/Final_Test.X/src/gyroscope.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/gyroscope.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/gyroscope.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/gyroscope.p1 D:/Personal/FinalTest/Final_Test.X/src/gyroscope.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/gyroscope.d ${OBJECTDIR}/_ext/448146715/gyroscope.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/gyroscope.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1: D:/Personal/FinalTest/Final_Test.X/src/usb/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1262290086" 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1 D:/Personal/FinalTest/Final_Test.X/src/usb/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/1262290086/usb_descriptors.d ${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1262290086/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1262290086/usb_device.p1: D:/Personal/FinalTest/Final_Test.X/src/usb/usb_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1262290086" 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_device.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1262290086/usb_device.p1 D:/Personal/FinalTest/Final_Test.X/src/usb/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/1262290086/usb_device.d ${OBJECTDIR}/_ext/1262290086/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1262290086/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1: D:/Personal/FinalTest/Final_Test.X/src/usb/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1262290086" 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1 D:/Personal/FinalTest/Final_Test.X/src/usb/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.d ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1262290086/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1262290086/usb_events.p1: D:/Personal/FinalTest/Final_Test.X/src/usb/usb_events.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1262290086" 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_events.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1262290086/usb_events.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1262290086/usb_events.p1 D:/Personal/FinalTest/Final_Test.X/src/usb/usb_events.c 
	@-${MV} ${OBJECTDIR}/_ext/1262290086/usb_events.d ${OBJECTDIR}/_ext/1262290086/usb_events.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1262290086/usb_events.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1: D:/Personal/FinalTest/Final_Test.X/src/app_device_cdc_basic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1 D:/Personal/FinalTest/Final_Test.X/src/app_device_cdc_basic.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.d ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/app_device_cdc_basic.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/main.p1: D:/Personal/FinalTest/Final_Test.X/src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/main.p1 D:/Personal/FinalTest/Final_Test.X/src/main.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/main.d ${OBJECTDIR}/_ext/448146715/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/system.p1: D:/Personal/FinalTest/Final_Test.X/src/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/system.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/system.p1 D:/Personal/FinalTest/Final_Test.X/src/system.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/system.d ${OBJECTDIR}/_ext/448146715/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/motor.p1: D:/Personal/FinalTest/Final_Test.X/src/motor.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/motor.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/motor.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/motor.p1 D:/Personal/FinalTest/Final_Test.X/src/motor.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/motor.d ${OBJECTDIR}/_ext/448146715/motor.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/motor.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1: D:/Personal/FinalTest/Final_Test.X/src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1 D:/Personal/FinalTest/Final_Test.X/src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/app_led_usb_status.d ${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/interupts.p1: D:/Personal/FinalTest/Final_Test.X/src/interupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/interupts.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/interupts.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/interupts.p1 D:/Personal/FinalTest/Final_Test.X/src/interupts.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/interupts.d ${OBJECTDIR}/_ext/448146715/interupts.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/interupts.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/448146715/servo.p1: D:/Personal/FinalTest/Final_Test.X/src/servo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/448146715" 
	@${RM} ${OBJECTDIR}/_ext/448146715/servo.p1.d 
	@${RM} ${OBJECTDIR}/_ext/448146715/servo.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -DXPRJ_default=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/448146715/servo.p1 D:/Personal/FinalTest/Final_Test.X/src/servo.c 
	@-${MV} ${OBJECTDIR}/_ext/448146715/servo.d ${OBJECTDIR}/_ext/448146715/servo.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/448146715/servo.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
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
dist/${CND_CONF}/${IMAGE_TYPE}/Final_Test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/Final_Test.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto        $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/Final_Test.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/Final_Test.X.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Final_Test.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=dist/${CND_CONF}/${IMAGE_TYPE}/Final_Test.X.${IMAGE_TYPE}.map  -DXPRJ_default=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1  -fno-short-double -fno-short-float -memi=wordwrite -O0 -fasmfile -maddrqual=ignore -xassembler-with-cpp -I"header" -I"header/usb" -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx032 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -o dist/${CND_CONF}/${IMAGE_TYPE}/Final_Test.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
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