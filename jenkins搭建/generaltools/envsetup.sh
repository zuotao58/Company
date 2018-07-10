#!/bin/bash

source /etc/profile

TOP="/home/jenkinsroot/workspace"
echo $TOP
RES_CONFIGS="alldpi"
HOME_DIR="/home/jenkinsroot"

GRADLESDK_M="${HOME_DIR}/sdk/android-sdk-linux-m"
GRADLESDKSED_M=${GRADLESDK_M//\//\\\/}
GRADLENDK_M="${HOME_DIR}/ndk/android-ndk-m"
GRADLENDKSED_M=${GRADLENDK_M//\//\\\/}

GRADLESDK_N="${HOME_DIR}/sdk/android-sdk-linux-n"
GRADLESDKSED_N=${GRADLESDK_N//\//\\\/}
GRADLENDK_N="${HOME_DIR}/ndk/android-ndk-n"
GRADLENDKSED_N=${GRADLENDK_N//\//\\\/}
GRADLENOPENCV="/local/tools/OpenCV-android-sdk-N"
GRADLENOPENCVSED=${GRADLENOPENCV//\//\\\/}



function choose_module()
{
    trap 'traperror ${LINENO} ${FUNCNAME} ${BASH_LINENO}' ERR
    local ANSWER
    echo
    echo "APK_MODULE choices for build are: "
    echo "        1.  AcuteagContacts"
    echo "        2.  AcuteagContactsCommon"
    echo "        3.  AcuteagContactsProvider"
    echo "        4.  AcuteagDialer"
    echo "        5.  AcuteagInCallUI"
    echo "        6.  AcuteagKeyguard"
    echo "        7.  AcuteagLauncher"
    echo "        8.  AcuteagManager"
    echo "        9.  AcuteagMms"
    echo "        10. AcuteagMmsService"
    echo "        11. AcuteagPhoneCommon"
    echo "        12. AcuteagPowerManager"
    echo "        13. AcuteagReject"
    echo "        14. AcuteagSettings"
    echo "        15. AcuteagSystemUI"
    echo "        16. AcuteagTelecomm"
    echo "        17. AcuteagTelephony"
    echo "        18. AcuteagTelephonyProvider"
    echo "        19. AcuteagThemeManager"
    echo "        20. AcuteagGallery"
    echo "        21. AcuteagPermissionControl"
    echo "        22. AcuteagDeskClock"
    echo "        23. AcuteagProvision"
    echo "        24. AcuteagNetManager"
    echo "        25. AcuteagQuickSearchBox"
    echo "        26. AcuteagFileManager"
    echo "        27. AcuteagCalendar"
    echo "        28. AcuteagCalendarProvider"
    echo "        29. AcuteagPackageInstaller"
    echo "        30. AcuteagSpiderMan"
    echo "        31. AcuteagApplicationsProvider"
    echo "        32. AcuteagDownloadProvider"
    echo "        33. AcuteagLockScreen"
    echo "        34. AcuteagCalculator"
    echo "        35. AcuteagUploadPhoneInfo"
    echo "        36. AcuteagSoundRecorder"
    echo "        37. AcuteagNote"


    echo -n "Your choice is: "
    if [ -z "${1}" ] ; then
        read ANSWER
    else
        echo ${1}
        ANSWER=${1}
    fi

        case ${ANSWER} in
        AcuteagContacts )
            MODULE=AcuteagContacts
            ;;
        1 )
            MODULE=AcuteagContacts
            ;;
        AcuteagContactsCommon )
            MODULE=AcuteagContactsCommon
            ;;
        2 )
            MODULE=AcuteagContactsCommon
            ;;
        AcuteagContactsProvider )
            MODULE=AcuteagContactsProvider
            ;;
        3 )
            MODULE=AcuteagContactsProvider
            ;;
        AcuteagDialer )
            MODULE=AcuteagDialer
            ;;
        4 )
            MODULE=AcuteagDialer
            ;;
        AcuteagInCallUI )
            MODULE=AcuteagInCallUI
            ;;
        5 )
            MODULE=AcuteagInCallUI
            ;;
        AcuteagKeyguard )
            MODULE=AcuteagKeyguard
            ;;
        6 )
            MODULE=AcuteagInCallUI
            ;;
        AcuteagLauncher )
            MODULE=AcuteagLauncher
            ;;
        7 )
            MODULE=AcuteagLauncher
            ;;
        AcuteagManager )
            MODULE=AcuteagManager
            ;;
        8 )
            MODULE=AcuteagManager
            ;;
        AcuteagMms )
            MODULE=AcuteagMms
            ;;
        9 )
            MODULE=AcuteagMms
            ;;
        AcuteagMmsService )
            MODULE=AcuteagMmsService
            ;;
        10 )
            MODULE=AcuteagMmsService
            ;;
        AcuteagPhoneCommon )
            MODULE=AcuteagPhoneCommon
            ;;
        11 )
            MODULE=AcuteagPhoneCommon
            ;;
        AcuteagPowerManager )
            MODULE=AcuteagPowerManager
            ;;
        12 )
            MODULE=AcuteagPowerManager
            ;;
        AcuteagReject )
            MODULE=AcuteagReject
            ;;
        13 )
            MODULE=AcuteagReject
            ;;
        AcuteagSettings )
            MODULE=AcuteagSettings
            ;;
        14 )
            MODULE=AcuteagSettings
            ;;
        AcuteagSystemUI )
            MODULE=AcuteagSystemUI
            ;;
        15 )
            MODULE=AcuteagSystemUI
            ;;
        AcuteagTelecomm )
            MODULE=AcuteagTelecomm
            ;;
        16 )
            MODULE=AcuteagTelecomm
            ;;
        AcuteagTelephony )
            MODULE=AcuteagTelephony
            ;;
        17 )
            MODULE=AcuteagTelephony
            ;;
        AcuteagTelephonyProvider )
            MODULE=AcuteagTelephonyProvider
            ;;
        18 )
            MODULE=AcuteagTelephonyProvider
            ;;
        AcuteagThemeManager )
            MODULE=AcuteagThemeManager
            ;;
        19 )
            MODULE=AcuteagThemeManager
            ;;
        AcuteagGallery )
            MODULE=AcuteagGallery
            ;;
        20 )
            MODULE=AcuteagGallery
            ;;
        AcuteagPermissionControl )
            MODULE=AcuteagPermissionControl
            ;;
        21 )
            MODULE=AcuteagPermissionControl
            ;;
        AcuteagDeskClock )
            MODULE=AcuteagDeskClock
            ;;
        22 )
            MODULE=AcuteagDeskClock
            ;;
        AcuteagProvision )
            MODULE=AcuteagProvision
            ;;
        23 )
            MODULE=AcuteagProvision
            ;;
        AcuteagNetManager )
            MODULE=AcuteagNetManager
            ;;
        24 )
            MODULE=AcuteagNetManager
            ;;
        AcuteagQuickSearchBox )
            MODULE=AcuteagQuickSearchBox
            ;;
        25 )
            MODULE=AcuteagQuickSearchBox
            ;;
        AcuteagFileManager )
            MODULE=AcuteagFileManager
            ;;
        26 )
            MODULE=AcuteagFileManager
           ;;
        AcuteagCalendar )
            MODULE=AcuteagCalendar
            ;;
        27 )
            MODULE=AcuteagCalendar
           ;;
        AcuteagCalendarProvider )
            MODULE=AcuteagCalendarProvider
            ;;
        28 )
            MODULE=AcuteagCalendarProvider
           ;;
        AcuteagPackageInstaller )
            MODULE=AcuteagPackageInstaller
            ;;
        29 )
            MODULE=AcuteagPackageInstaller
           ;;

        AcuteagSpiderMan )
            MODULE=AcuteagSpiderMan
            ;;
        30 )
            MODULE=AcuteagSpiderMan
           ;;
        AcuteagApplicationsProvider )
            MODULE=AcuteagApplicationsProvider
            ;;
        31 )
            MODULE=AcuteagApplicationsProvider
           ;;
        AcuteagDownloadProvider )
            MODULE=AcuteagDownloadProvider
            ;;
        32 )
            MODULE=AcuteagDownloadProvider
           ;;
        AcuteagLockScreen )
            MODULE=AcuteagLockScreen
            ;;
        33 )
            MODULE=AcuteagLockScreen
           ;;
        AcuteagCalculator )
            MODULE=AcuteagCalculator
            ;;
        34 )
            MODULE=AcuteagCalculator
           ;;
        AcuteagUploadPhoneInfo )
            MODULE=AcuteagUploadPhoneInfo
            ;;
        35 )
            MODULE=AcuteagUploadPhoneInfo
           ;;
        AcuteagSoundRecorder )
            MODULE=AcuteagSoundRecorder
            ;;
        36 )
            MODULE=AcuteagSoundRecorder
           ;;
        AcuteagNote )
            MODULE=AcuteagNote
            ;;
        37 )
            MODULE=AcuteagNote
           ;;
       * )
            echo "*********************************************************"
            echo "* Error:Can't Found The ${MODULE},Please Check"
            echo "*********************************************************"
            exit 1
            ;;
        esac
    trap - ERR

}



function choose_buildenv()
{
    trap 'traperror ${LINENO} ${FUNCNAME} ${BASH_LINENO}' ERR

    local ANSWER
    echo
    echo "Build_env choices for build are: "
    echo "    1. msm8998"
    echo "    2. gradlem"
    echo "    3. gradlen"
    echo

    echo -n "Your choice is: "
    if [ -z "$1" ] ; then
	read ANSWER
    else
        echo $1
	ANSWER=$1
    fi
        
    case $ANSWER in
	msm8998 )
	    BUILD_ENV=msm8998
	    ;;
        1 )
	    BUILD_ENV=msm8998
	    ;;
        gradlem )
	    BUILD_ENV=gradlem
	    ;;
        2 )
	    BUILD_ENV=gradlem
            ;;
        gradlen )
	    BUILD_ENV=gradlen
	    ;;
        3 )
	    BUILD_ENV=gradlen
            ;;
        * )
            echo "**********************************************************"
            echo "* Error:Can't Found The ${BUILD_ENV},Please Check."
            echo "**********************************************************"
            exit 1
            ;;
        esac
    trap - ERR
}


# Force JAVA_HOME to point to java 1.7 or java 1.6  if it isn't already set.
#
# Note that the MacOS path for java 1.7 includes a minor revision number (sigh).
# For some reason, installing the JDK doesn't make it show up in the
# JavaVM.framework/Versions/1.7/ folder.
function set_java_home() {
    # Clear the existing JAVA_HOME value if we set it ourselves, so that
    # we can reset it later, depending on the version of java the build
    # system needs.
    #
    # If we don't do this, the JAVA_HOME value set by the first call to
    # build/envsetup.sh will persist forever.
    if [ -n "$ANDROID_SET_JAVA_HOME" ]; then
      export JAVA_HOME=""
    fi

    if [ ! "$JAVA_HOME" ]; then
      if [ -n "$LEGACY_USE_JAVA6" ]; then
        case `uname -s` in
            Darwin)
                export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home
                ;;
            *)
                export JAVA_HOME=/usr/lib/jvm/java-6-sun
                ;;
        esac
      else
        case `uname -s` in
            Darwin)
                export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
                ;;
            *)
                export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
                ;;
        esac
      fi

      # Keep track of the fact that we set JAVA_HOME ourselves, so that
      # we can change it on the next envsetup.sh, if required.
      #export ANDROID_SET_JAVA_HOME=true
    fi
   
    echo "ANDROID_SET_JAVA_HOME:${ANDROID_SET_JAVA_HOME}"
    if [ "$BUILD_ENV" == "gradlen" ] ; then
      if [ -z ${ANDROID_SET_JAVA_HOME} ] || [ -z `javac -version 2>&1 | grep -o '[ "]1\.8[\. "$$]'` ] ; then
        local LOCAL_JAVA_TOOLS="$TOP/acuteag_generaltools/buildtools/java-8-openjdk-amd64"
        echo "****** LOCAL_JAVA_TOOLS:${LOCAL_JAVA_TOOLS}"
        if [ -d $LOCAL_JAVA_TOOLS ] ; then
            echo "JDK8 Settings"
            export JAVA_HOME=$LOCAL_JAVA_TOOLS
            export JRE_HOME=$JAVA_HOME/jre
            export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib
            export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
        else
            echo "Please check with integration for how to install OpenJDK8.\nOtherwise you can not compile Android-N."
        fi
      fi
    elif [ "$BUILD_ENV" == "gradlem" ]; then
      if [ -z ${ANDROID_SET_JAVA_HOME} ] ||  [ -z `javac -version 2>&1 | grep -o '[ "]1\.7[\. "$$]'` ] ; then
        local LOCAL_JAVA_TOOLS="$TOP/acuteag_generaltools/buildtools/java-7-openjdk-amd64"
        echo "****** LOCAL_JAVA_TOOLS:${LOCAL_JAVA_TOOLS}"
        if [ -d $LOCAL_JAVA_TOOLS ] ; then
            echo "JDK7 Settings"
            export JAVA_HOME=$LOCAL_JAVA_TOOLS
            export JRE_HOME=$JAVA_HOME/jre
            export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib
            export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
        else
            echo "Please check with integration for how to install OpenJDK7.\nOtherwise you can not compile Android-L/M."
        fi
      fi
    fi
}

function set_build_gradle_m()
{
     export SDKTOOL="${HOME_DIR}/sdk/android-sdk-linux-m"
     export PATH="$SDKTOOL:$PATH"
     GRADLEVERSION=gradle-2.14.1
     export GRADLEHOME="${HOME_DIR}/gradle/$GRADLEVERSION"
     export PATH="$GRADLEHOME:$GRADLEHOME/bin:$PATH"
}

function set_build_gradle_n()
{
   export SDKTOOL="${HOME_DIR}/sdk/android-sdk-linux-n"
   export PATH="$SDKTOOL:$PATH"
   GRADLEVERSION=gradle-2.14.1
   export GRADLEHOME="${HOME_DIR}/gradle/$GRADLEVERSION"
   export PATH="$GRADLEHOME:$GRADLEHOME/bin:$PATH"
}

function sdkprefix()
{
   strtmp=${TOP//[^\/]}
   strnum=${#strtmp}
   i=1
   while [ $i -le ${strnum} ]
   do
     sdkprefixstr="..\/"${sdkprefixstr}
     let i++
   done
}


function build_apk()
{
    APK_MODULE=$1
    BUILD_ENV=$2
    if [ -z "$1" ] ; then
        choose_module
    fi
    if [ -z "$2" ] ; then
        choose_buildenv
    fi
    echo "****** Origin PATH:$PATH"
    PATH_BACKUP=$PATH
    echo "****** APK_MODULE:"$APK_MODULE
    echo "****** BUILD_EVN:"$BUILD_ENV
    if [ "$BUILD_ENV" == "gradlem" ]; then
       set_build_gradle_m     
       if [ ! -f $TOP/$APK_MODULE/local.properties ]; then
         cp $TOP/acuteag_generaltools/gradle_sdk/local.properties $TOP/${APK_MODULE}/local.properties
       fi
       if [ -d $GRADLESDK_M ] && [ -f $TOP/${APK_MODULE}/local.properties ];then
          echo "****** Gradle SDK:"$GRADLESDK_M
          sed -i -e "s/sdk.dir=.*/sdk.dir=${GRADLESDKSED_M}/" $TOP/${APK_MODULE}/local.properties
          sed -i -e "s/ndk.dir=.*/ndk.dir=${GRADLENDKSED_M}/" $TOP/${APK_MODULE}/local.properties
       fi
    elif [ "$BUILD_ENV" == "gradlen" ]; then
       set_build_gradle_n
       if [ ! -f $TOP/$APK_MODULE/local.properties ]; then
         cp $TOP/acuteag_generaltools/gradle_sdk/local.properties $TOP/${APK_MODULE}/local.properties
       fi
       if [ -d $GRADLESDK_N ] && [ -f $TOP/${APK_MODULE}/local.properties ];then
          echo "****** Gradle SDK:"$GRADLESDK_N
          sed -i -e "s/sdk.dir=.*/sdk.dir=${GRADLESDKSED_N}/" $TOP/${APK_MODULE}/local.properties
          sed -i -e "s/ndk.dir=.*/ndk.dir=${GRADLENDKSED_N}/" $TOP/${APK_MODULE}/local.properties
          if [ -d $GRADLENDK_N ] && [ -f $TOP/${APK_MODULE}/gradle.properties ];then
          	sed -i -e "s/ndkDir=.*/ndkDir=${GRADLENDKSED_N}/" $TOP/${APK_MODULE}/gradle.properties
          fi
          if [ -d $GRADLENOPENCV ] && [ -f $TOP/${APK_MODULE}/app/src/main/jni/Android.mk ];then
                sed -i -e "s/OPENCVROOT:=.*/OPENCVROOT:=${GRADLENOPENCVSED}/" $TOP/${APK_MODULE}/app/src/main/jni/Android.mk
          fi
       fi
    else
       export ANT_HOME="/local/apache-ant-1.9.4"
       export SDKTOOL="/local/sdk/tools"
       export PATH="$SDKTOOL:$ANT_HOME/bin:$PATH"
    fi
    set_java_home
    echo "****** Update PATH:$PATH"

    if [ "$BUILD_ENV" == "msm8998" ]; then
        platformdepend="AcuteAngle_APP_Build/msm8998"
	PRODUCT_NAME="acuteangle"
    fi

    if [ "$BUILD_ENV" == "msm8998" ] ; then
        cd $TOP/$platformdepend
	echo "****** $TOP/$platformdepend"
        if [ -d .repo ];then
              echo "******* Start repo forall -c 'git clean -df && git reset --hard HEAD'"
              repo forall -c 'git clean -df && git reset --hard HEAD'
              repo sync
              if [ $? -ne 0 ]; then
                  rm -rf .repo
                  echo "****** Rm  -rf .repo"
                  echo "****** Repo Reset Error!"
              fi
        fi

	rm -rf AcuteagBase/vendor/acuteangle/acuteag-apps/
	rm -rf vendor/acuteangle/acuteag-apps/
        rm -rf out/target/product/$PRODUCT_NAME/system/app
        rm -rf out/target/product/$PRODUCT_NAME/system/priv-app
        rm -rf frameworks/base/packages/SystemUI/plugin/ 

        #if [ "${APK_MODULE}" == "AcuteagSettings" ];then
        #     ./TmakeAcuteag -v userdebug ${PRODUCT_NAME} -p vendor/acuteag/${APK_MODULE}/ext
        #fi

        if [ "${APK_MODULE}" == "AcuteagSystemUI" ];then
             ./TmakeAcuteag -v userdebug ${PRODUCT_NAME} -p frameworks/base/core/res/
             ./TmakeAcuteag -v userdebug ${PRODUCT_NAME} -p frameworks/base
             rm -rf vendor/acuteangle/acuteag-framework 
            # ./TmakeAcuteag -v userdebug ${PRODUCT_NAME} -p vendor/acuteag/AcuteagKeyguard
        fi
 
        ./TmakeAcuteag -v userdebug ${PRODUCT_NAME} -p packages/apps/${APK_MODULE}

    elif [ "$BUILD_ENV" == "gradlen" ] || [ "$BUILD_ENV" == "gradlem" ]; then 
        platformdepend=""
        cd $TOP/$APK_MODULE
        echo "JAVA_HOME:${JAVA_HOME}"
        gradle clean
        gradle assembleRelease
    else
        echo "environment is set error!"
        export PATH=$PATH_BACKUP
        echo "*****recover PATH=$PATH"
        exit 1
    fi
    export PATH=$PATH_BACKUP
    echo "****** Revert PATH:$PATH"
    cd $TOP
}
