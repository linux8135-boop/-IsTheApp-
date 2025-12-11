#!/usr/bin/env bash

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Attempt to set APP_HOME
# Resolve links: $0 may be a symlink
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls -ld "$PRG"
    link=`ls -l "$PRG" | awk '{print $NF}'`
    case $link in
      /*)
        PRG="$link"
        ;;
      *)
        PRG=`dirname "$PRG"`"/$link"
        ;;
    esac
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"`/" >/dev/null
APP_HOME="`pwd -P`"
cd "$SAVED" >/dev/null

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn ( ) {
    echo "$*"
}

die ( ) {
    echo
    echo "$*"
    echo
    exit 1
}

# OS specific support (must be 'true' or 'false').
cygwin=false
msys=false
darwin=false
nonstop=false
case "`uname`" in
  CYGWIN* )
    cygwin=true
    ;;
  Darwin* )
    darwin=true
    ;;
  MINGW* )
    msys=true
    ;;
  NONSTOP* )
    nonstop=true
    ;;
esac

# Increase the maximum file descriptors if we can.
if [ "$cygwin" = "false" -a "$darwin" = "false" -a "$nonstop" = "false" ] ; then
    MAX_FD_LIMIT=`ulimit -H -n`
    if [ $? -eq 0 ] ; then
        if [ "$MAX_FD" = "maximum" -o "$MAX_FD" = "max" ] ; then
            MAX_FD="$MAX_FD_LIMIT"
        fi
        ulimit -n $MAX_FD
        if [ $? -ne 0 ] ; then
            warn "Could not set maximum file descriptor limit: $MAX_FD"
        fi
    else
        warn "Could not query maximum file descriptor limit: $MAX_FD_LIMIT"
    fi
fi

# For Darwin, add options to specify how the application appears in the dock
if $darwin; then
    DEFAULT_JVM_OPTS="$DEFAULT_JVM_OPTS \"-Xdock:name=$APP_NAME\" \"-Xdock:icon=$APP_HOME/media/gradle.icns\""
fi

# For Cygwin, switch paths to Windows format before running java
if $cygwin ; then
    APP_HOME=`cygpath --path --mixed "$APP_HOME"`
    CLASSPATH=`cygpath --path --mixed "$CLASSPATH"`
    JAVACMD=`cygpath --url "$JAVACMD"`

    # We build the pattern for arguments to be converted via cygpath
    ROOTDIRSRAW=`find -L / -maxdepth 3 -type d -name .gradle 2>/dev/null | head -1`
    [ -z "$ROOTDIRSRAW" ] && ROOTDIRSRAW=`find -L / -maxdepth 3 -type d -name .gradle 2>/dev/null | head -1`
    [ -n "$ROOTDIRSRAW" ] && ROOTDIR=`find -L "$ROOTDIRSRAW"/../.. -maxdepth 2 -type d -name gradle-$GRADLE_VERSION 2>/dev/null | head -1`
    [ -n "$ROOTDIR" ] && ROOTDIR=`cd "$ROOTDIR" && pwd`
    [ -z "$ROOTDIR" ] && ROOTDIR=`pwd`
    CLASSPATH="$APP_HOME/gradle/wrapper/gradle-wrapper.jar:$CLASSPATH"

    # Determine the Java command to use to start the JVM.
    if [ -n "$JAVA_HOME" ] ; then
        if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
            # IBM's JDK on AIX uses strange locations for the executables
            JAVACMD="$JAVA_HOME/jre/sh/java"
        else
            JAVACMD="$JAVA_HOME/bin/java"
        fi
    else
        JAVACMD="`which java`"
    fi

    # Increase the maximum file descriptors if we can.
    if [ "$cygwin" = "false" -a "$darwin" = "false" -a "$nonstop" = "false" ] ; then
        MAX_FD_LIMIT=`ulimit -H -n`
        if [ $? -eq 0 ] ; then
            if [ "$MAX_FD" = "maximum" -o "$MAX_FD" = "max" ] ; then
                MAX_FD="$MAX_FD_LIMIT"
            fi
            ulimit -n $MAX_FD
            if [ $? -ne 0 ] ; then
                warn "Could not set maximum file descriptor limit: $MAX_FD"
            fi
        else
            warn "Could not query maximum file descriptor limit: $MAX_FD_LIMIT"
        fi
    fi

    # Collect all arguments for the java command, stacking in reverse order:
    #    * args from the command line
    #    * the main class name
    #    * -classpath
    #    * -D...appname settings
    #    * --module-path (only if needed)
    #    * DEFAULT_JVM_OPTS, JAVA_OPTS, and GRADLE_OPTS environment variables.

    # For Cygwin or MSYS, switch paths to Windows format before everything else
    if [ "$cygwin" = "true" -o "$msys" = "true" ] ; then
        APP_HOME=`cygpath --path --mixed "$APP_HOME"`
        CLASSPATH=`cygpath --path --mixed "$CLASSPATH"`

        JAVACMD=`cygpath --url "$JAVACMD"`

        # Now convert the arguments - kludge to limit ourselves only to /bin/sh
        i=0
        for arg in "$@" ; do
            CHECK=`echo "$arg"|egrep -c "$OURCYGPATTERN" -`
            CHECK2=`echo "$arg"|egrep -c "^-"`                                 ### Determine if an option

            if [ $CHECK -ne 0 ] && [ $CHECK2 -eq 0 ] ; then                    ### Added a condition
                arg=`cygpath --path --mixed "$arg"`
            fi
            i=$((i+1))
            eval `echo args$i`=`cygpath --quote --mixed "$arg"`
        done
        case $i in
            (0) set -- ;;
            (1) set -- "$args1" ;;
            (2) set -- "$args1" "$args2" ;;
            (3) set -- "$args1" "$args2" "$args3" ;;
            (4) set -- "$args1" "$args2" "$args3" "$args4" ;;
            (5) set -- "$args1" "$args2" "$args3" "$args4" "$args5" ;;
            (6) set -- "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" ;;
            (7) set -- "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" "$args7" ;;
            (8) set -- "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" "$args7" "$args8" ;;
        esac
    fi

    # Escape application args
    save ( ) {
        for i do printf %s\\n "$i" | sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/' \\\\/" ; done
        echo " "
    }
    APP_ARGS=$(save "$@")

    # Collect all arguments for the java command, following the shell quoting and substitution rules
    eval `echo cmd=\'$cmd\'`
    eval `echo args=\($APP_ARGS\)`

    runjava() {
        # Damn cygwin shell again
        eval $JAVACMD $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS -classpath \$CLASSPATH org.gradle.wrapper.GradleWrapperMain "$@"
    }

    # If we're on a Mac, add a Java system property to change the look and feel of the Swing application.
    if $darwin; then
        runjava "$@"
        exit
    fi

    runjava "$@"
    exit
fi

# Split up the JVM_OPTS And GRADLE_OPTS values into an array, following the shell quoting and substitution rules
function splitJvmOpts() {
    JVM_OPTS=("$@")
}
eval splitJvmOpts $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS


# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
else
    JAVACMD="`which java`"
fi

# Increase the maximum file descriptors if we can.
if [ "$cygwin" = "false" -a "$darwin" = "false" -a "$nonstop" = "false" ] ; then
    MAX_FD_LIMIT=`ulimit -H -n`
    if [ $? -eq 0 ] ; then
        if [ "$MAX_FD" = "maximum" -o "$MAX_FD" = "max" ] ; then
            MAX_FD="$MAX_FD_LIMIT"
        fi
        ulimit -n $MAX_FD
        if [ $? -ne 0 ] ; then
            warn "Could not set maximum file descriptor limit: $MAX_FD"
        fi
    else
        warn "Could not query maximum file descriptor limit: $MAX_FD_LIMIT"
    fi
fi

# Collect all arguments for the java command, stacking in reverse order:
#    * args from the command line
#    * the main class name
#    * -classpath
#    * -D...appname settings
#    * --module-path (only if needed)
#    * DEFAULT_JVM_OPTS, JAVA_OPTS, and GRADLE_OPTS environment variables.

# For Cygwin or MSYS, switch paths to Windows format before everything else
if [ "$cygwin" = "true" -o "$msys" = "true" ] ; then
    APP_HOME=`cygpath --path --mixed "$APP_HOME"`
    CLASSPATH=`cygpath --path --mixed "$CLASSPATH"`

    JAVACMD=`cygpath --url "$JAVACMD"`

    # Now convert the arguments - kludge to limit ourselves only to /bin/sh
    i=0
    for arg in "$@" ; do
        CHECK=`echo "$arg"|egrep -c "$OURCYGPATTERN" -`
        CHECK2=`echo "$arg"|egrep -c "^-"`                                 ### Determine if an option

        if [ $CHECK -ne 0 ] && [ $CHECK2 -eq 0 ] ; then                    ### Added a condition
            arg=`cygpath --path --mixed "$arg"`
        fi
        i=$((i+1))
        eval `echo args$i`=`cygpath --quote --mixed "$arg"`
    done
    case $i in
        (0) set -- ;;
        (1) set -- "$args1" ;;
        (2) set -- "$args1" "$args2" ;;
        (3) set -- "$args1" "$args2" "$args3" ;;
        (4) set -- "$args1" "$args2" "$args3" "$args4" ;;
        (5) set -- "$args1" "$args2" "$args3" "$args4" "$args5" ;;
        (6) set -- "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" ;;
        (7) set -- "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" "$args7" ;;
        (8) set -- "$args1" "$args2" "$args3" "$args4" "$args5" "$args6" "$args7" "$args8" ;;
    esac
fi

# Escape application args
save ( ) {
    for i do printf %s\\n "$i" | sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/' \\\\/" ; done
    echo " "
}
APP_ARGS=$(save "$@")

# Collect all arguments for the java command, following the shell quoting and substitution rules
eval `echo cmd=\'$JAVACMD\'`
eval `echo args=\"$APP_ARGS\"`

# Execute the command
exec "$cmd" "${args[@]}"
