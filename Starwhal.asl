//Made by Ri
//This is just a load remover, not an autosplitter at the moment
//I am planning on adding autosplitting in the next week or two
//Discord: gay.com

state("starwhal")
{   //Worth noting that this variable can be in a loading state
    //while first booting the game in the main menu.
    //This was the offset I found least likely to do that.
    int loading : 0x009E2114, 0x2C, 0xC, 0x18, 0x40, 0x2C, 0x1C;
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

update
{

}