/* The bootloader will look at this image and start execution at the symbol _start */
ENTRY(_start)

SECTIONS
{
	/* We begin putting sections at 1 MiB, a conventional place for kernels to be loaded */
	/* at lower addresses, there are BIOS data and memory-mapped hardware */
	. = 1M;

	/* First put the multiboot header, as it is required to be put very early in the image */
	/* otherwise the bootloader won't recognize the file format. */
	.text BLOCK(4K) : ALIGN(4K)
	{
		*(.multiboot)
		*(.text)
	}

	/* Read-only data. */
	.rodata BLOCK(4K) : ALIGN(4K)
	{
		*(.rodata)
	}

	/* Read-write data (initialized) */
	.data BLOCK(4K) : ALIGN(4K)
	{
		*(.data)
	}

	/* Read-write data (uninitialized) and stack */
	.bss BLOCK(4K) : ALIGN(4K)
	{
		*(COMMON)
		*(.bss)
	}

	/* The compiler may produce other sections, by default it will put them in
	   a segment with the same name. Alternatively, add them here as needed. */
}
