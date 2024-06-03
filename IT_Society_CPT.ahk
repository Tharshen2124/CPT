Alt::{
	numOfColumns := InputBox("Enter number of columns to", "Number of Columns").value
	sleep(100)

	numOfRows := InputBox("Enter number of rows to", "Number of Rows").value
	sleep(100)

	PixelSearch(&OutputVarX, &OutputVarY, 0, 0, 600, 400, 0x1A73E8)

	if(!OutputVarX && !OutputVarY && numOfColumns && numOfRows) {
		MsgBox("Something went wrong...")
		return
	}

	MouseClick "Left", OutputVarX+10, OutputVarY+10

	Loop numOfRows {
		loopThroughColumnsFunc(numOfColumns)
		backToFirstColumnFunc(numOfColumns)
	}
}

^+s::{
	numOfCopies := InputBox("How many copies do you want?", "Number of Columns").value

	BreakPage := "^{Enter}"

	Loop numOfCopies {
		Send BreakPage
		sleep(100)
		Send "^v"
		sleep(100)
	}
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