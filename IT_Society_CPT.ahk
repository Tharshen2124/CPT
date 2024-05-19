
^2::{
	Send "+{Click 100 200}"
	PixelSearch(&OutputVarX, &OutputVarY, 0, 0, 1500, 700, 0x1A73E8)

	if (!OutputVarX && !OutputVarY) 
	{
		MsgBox "Something went wrong..."
	} 
	else {
		MouseClick "left", OutputVarX, OutputVarY
		Send("^c")
		MouseClick "left", OutputVarX+200, OutputVarY
		Send("^v")
		Send "{Right}"
		Sleep 1000
		MsgBox "Done!"
	}
}