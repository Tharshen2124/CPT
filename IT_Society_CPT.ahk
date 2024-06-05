Alt::{
	MyGui := Gui("")
	MyGui.SetFont("s12")
	MyGui.Add("Text", "Section Center w250", "IT Society CPT")
	MyGui.SetFont("s10")
	BtnMakeCopies := MyGui.Add("Button","Section w250", "Make Copies")
	BtnTransfer := MyGui.Add("Button", "Section w250", "Transfer data from spreadsheet to docs")
	BtnMakeCopies.OnEvent("Click", CallCopyFn)
	BtnTransfer.OnEvent("Click", CallTransferFn)
	MyGui.Show
}

CallCopyFn(*) {
	MyGui := Gui("")
	MyGui.SetFont("s12")
	MyGui.Add("Text", "Section Center w250", "IT Society CPT")
	MyGui.SetFont("s10")
	MyGui.Add("Text","Section", "Enter number of columns: ")
	MyGui.Add("Edit", "w250")
	MyGui.Add("Text", "Section", "Enter number of rows: ") 
	MyGui.Add("Edit", "w250")
	MyGui.Add("Button", "Section w250", "Confirm")
	MyGui.Show

	; Loop numOfCopies {
	; 	Send "^{Enter}"
	; 	sleep(100)
	; 	Send "^v"
	; 	sleep(100)
	; }
	MsgBox("hi")
}

CallTransferFn(*) {
	MyGui := Gui("")
	MyGui.SetFont("s12")
	MyGui.Add("Text", "Section Center w250", "IT Society CPT")
	MyGui.SetFont("s10")
	MyGui.Add("Text","Section", "How many copies do you want?")
	editValue = MyGui.Add("Edit", "w250")
	ConfirmButton = MyGui.Add("Button", "Section w250 c0xFF2211", "Confirm")
	ConfirmButton.OnEvent("click", MakeCopiesFn)
	MyGui.Show

	; PixelSearch(&OutputVarX, &OutputVarY, 0, 0, 600, 400, 0x1A73E8)

	; if(!OutputVarX && !OutputVarY && numOfColumns && numOfRows) {
	; 	MsgBox("Something went wrong...")
	; 	return
	; }

	; MouseClick "Left", OutputVarX+10, OutputVarY+10

	; Loop numOfRows {
	; 	loopThroughColumnsFunc(numOfColumns)
	; 	backToFirstColumnFunc(numOfColumns)
	; }
}

loopThroughColumnsFunc(numOfColumns) {
	count := 0
	Loop numOfColumns {
		count++
		Send "^c"
		sleep(100)
		
		Send "^{Tab}"
		sleep(100)
		
		Send "^v"
		sleep(100)


		if(count <= numOfColumns - 1) {
			Send "{Down}"		
			sleep(100)
		} else {
			Loop 3 {
				Send "{Down}"
			}
		}	
		Send "^+{Tab}"
		sleep(100)

		if(count <= numOfColumns - 1) {
			Send "{Right}"
			sleep(100)
		}
	}
}

backToFirstColumnFunc(numOfColumns) {
	Send "{Down}"
	Loop numOfColumns-1 {
		Send "{Left}"
		sleep(100)
	}
}