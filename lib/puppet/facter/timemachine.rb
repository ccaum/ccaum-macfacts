require 'facter'
require 'facter/util/plist/parser'

completed = File.exists? '/private/var/db/.TimeMachine.Results.plist'

Facter.add("timemachine_volume") do
  confine :kernel => "Darwin"
  setcode do
    %x{defaults read /Library/Preferences/com.apple.TimeMachine LocalizedDiskImageVolumeName}.chomp
  end 
end

Facter.add("timemachine_autobackup") do
  confine :kernel => "Darwin"
  setcode do
    %x{defaults read /Library/Preferences/com.apple.TimeMachine AutoBackup} == 0 ? 'no' : 'yes'
  end 
end

Facter.add('timemachine_inprogress') do
  confine :kernel => "Darwin"
  setcode do
    completed ? 'no' : 'yes'
  end 
end

if completed
  plist = Plist::parse_xml('/private/var/db/.TimeMachine.Results.plist')

  Facter.add("timemachine_lastrun") do
    confine :kernel => "Darwin"
    setcode do
      plist['BACKUP_COMPLETED_DATE']
    end 
  end 

  Facter.add("timemachine_lastrun_successful") do
    confine :kernel => "Darwin"
    setcode do
      plist['RESULT'].to_i <= 13 ? 'yes' : 'no'
    end 
  end 
end
