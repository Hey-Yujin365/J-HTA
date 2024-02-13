package net4;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

public class ClientExitHandler implements Handler {

	private Scanner scanner;
	public ClientExitHandler(Scanner scanner) {
		this.scanner = scanner;
	}

	@Override
	public void handle(DataInputStream in, DataOutputStream out) throws IOException {
		// TODO Auto-generated method stub
		
	}

}
