macfacts
=======

This module contains custom facter facts for Mac OS X


Time Machine
------------

The Time Machine facts are as follows

### timemachine_volume

The configured full path to the volume Time Machine is configured to use

### timemachine_autobackup

Whether or not Time Machine is configured to run automatically.  Possible values are `yes` or `no`

### timemachine_inprogress

Whether or not a Time Machine backup is currently in progress.  Possible values are `yes` or `no`

### timemachine_lastrun

Shows the date and time of the last completed backup

### timemachine_lastrun_successful

Whether or not the last Time Machine backup was successful or had errors.  Possible values are `yes` or `no`


Warranty
--------

These facts were originally written by Gary Larizza (twitter: @glarizza) which I modifed
to be more in line with what I wanted.

### purchase_date

The date the Mac was purchased

### warranty_out

Whether or not the Mac is out of warranty.  Possible values are `yes` or `no`

### warranty_end

The date the warranty will end
