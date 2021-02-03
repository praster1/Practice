#include <string>
#include <iostream>

int main(void)
{
	std::string strData = "Test string";
	std::cout << "Sample string" << std::endl;
	std::cout << strData <<std::endl;
	
	strData = "New String";
	std::cout << strData << std::endl;
	
	std::cout << "저는" << 20 << "살" << "입니다." << std::endl;
	
	return 0;
}
