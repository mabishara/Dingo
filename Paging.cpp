#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
	int p, f, m_size, p_size, logic_mem, num_frame_page, num_frame;
	int p_array[25];
	char f_array[40];
	int temp_array[40] = { 0 };//initializing array with all 0

	//taking input from user
	printf("Physical memory in MB: ");
	scanf_s("%d", &m_size);
	printf("Logical memory in MB: ");
	scanf_s("%d", &logic_mem);
	printf("Page size in MB: ");
	scanf_s("%d", &p_size);

	//equations for no of pages & no of frames
	num_frame_page = logic_mem / p_size;
	num_frame = m_size / p_size;

	//initializing frame array with '-'

	for (int i = 0; i <= num_frame; i++)
		f_array[i] = '-';

	//assigning frame to each page
	for (int i = 0; i < num_frame_page; i++)
	{
		printf("Frame for page %d: ", i + 1);
		scanf_s("%d", &p_array[i]);
		temp_array[p_array[i] - 1] = i + 1;
		//printf("\nTemp array: %d", temp_array[p_array[i] - 1]);
	}

	//assigning data to page
	for (int i = 0; i < num_frame_page; i++)
	{
		printf("Page %d data: ", i+1);
		scanf_s(" %c", &f_array[p_array[i]]);
	}

	printf("\n\n");
	printf("-------Page table--------");
	printf("\n\n");
	printf("Page number	 Page frame");
	for (p = 0; p < num_frame_page; p++)
	{
		printf("\n%d\t\t %c", p + 1, f_array[p_array[p]]);
	}

	printf("\n\n");
	printf("------Frame table--------");
	printf("\n\n");
	printf("Frame number     Page number     Data");

	for (f = 0; f < num_frame; f++) {
		if (temp_array[f] == 0) 
			printf("\n%d\t\t -\t\t %c", f + 1, f_array[f + 1]);
		else
			printf("\n%d\t\t %d\t\t %c", f + 1, temp_array[f], f_array[f + 1]);
	}
	printf("\n");
}