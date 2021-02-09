#/bin/bash

# Jupyter-build doesn't have an option to automatically show the 
# saved reports, which makes it difficult to debug the reasons for 
# build failures in CI. This is a simple wrapper to handle that.

REPORTDIR=_build/html/reports

jupyter-book build -W -n --keep-going .
RETVAL=$?
if [ $RETVAL -ne 0 ]; then
    echo "Error occured; showing saved reports"
    cat $REPORTDIR/*
else
    # Clear out any old reports
    rm -f $REPORTDIR/*
fi
exit $RETVAL
