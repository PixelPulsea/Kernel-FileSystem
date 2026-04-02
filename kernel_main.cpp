#define whitecol 0x07

extern "C" {
	void kernel_main() {
		const char* message = "hi";
		unsigned short* vgabuf = (unsigned short*)0xB8000;

		for(int i = 0; message[i] != '\0'; i++) {
			vgabuf[i] = (unsigned short)message[i] | (0x0F << 8);
		}
	}
}
