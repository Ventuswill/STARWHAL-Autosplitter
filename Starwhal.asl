//Made by Ri
//Discord: gay.com

state("starwhal")
{   //Worth noting that the loading variable can be in a loading state
    //while first booting the game in the main menu.
    //This was the offset I found least likely to do that.
    int loading : 0x009E2114, 0x2C, 0xC, 0x18, 0x40, 0x2C, 0x1C;
    int level : 0x009E2A64, 0x254, 0x78, 0x44, 0x8, 0x14, 0x28, 0x0, 0x420;
}

startup
{
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "Your timing method is set to Real Time.\nWould you like to switch to Game time to remove load times?",
            "LiveSplit | STARWHAL",
            MessageBoxButtons.YesNo,
            MessageBoxIcon.Question);
        
        if (timingMessage == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;
    }
}

isLoading
{
    return current.loading != 0;
}

exit
{
	timer.IsGameTimePaused = true;
}

split
{
	return current.level != 0 && current.level != old.level;
}



update
{

}