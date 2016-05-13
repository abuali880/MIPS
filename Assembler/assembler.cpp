#include <iostream>
#include <fstream>
#include <string>
#include <bitset>
using namespace std;
class label
{
private:
	int address[40];
	string name[40];
	int size;
public:
	label()
	{
		size = 0;
	}
	void addlabel(string n,int addre)
	{
        address[size] = addre;
		name[size] = n;
		size ++;
	}
	int getadd(string n)
	{
		int f=0; 
		for(int i= 0;i<size;i++)
		{
			if(name[i] == n)
			{f = address[i];}
		}
		return f; // if return 0, it mean that label name doesn't exist
	}
};
string OpCode (string s)
{
	if (s=="add" || s=="sub" || s=="and" || s=="nor" || s=="slt" || s=="sll" || s=="jr") return "000000";
	else if (s=="addi") return "001000";
	else if (s=="lw") return "100011";
	else if (s=="sw") return "101011";
	else if (s=="andi") return "001100";
	else if (s=="beq") return "000100";
	else if (s=="j" || s=="J") return "000010";
	else if (s=="jal") return "000011";
	else return "";
}
string reg(string g)
{
	if (g=="$zero" || g=="$0" || g=="($zero)" || g=="($0)") return "00000";
	else if (g=="$a0" || g=="($a0)") return "00100";
	else if (g=="$a1" || g=="($a1)") return "00101";
	else if (g=="$a2" || g=="($a2)") return "00110";
	else if (g=="$a3" || g=="($a3)") return "00111";
	else if (g=="$t0" || g=="($t0)") return "01000";
	else if (g=="$t1" || g=="($t1)") return "01001";
	else if (g=="$t2" || g=="($t2)") return "01010";
	else if (g=="$t3" || g=="($t3)") return "01011";
	else if (g=="$t4" || g=="($t4)") return "01100";
	else if (g=="$t5" || g=="($t5)") return "01101";
	else if (g=="$t6" || g=="($t6)") return "01110";
	else if (g=="$t7" || g=="($t7)") return "01111";
	else if (g=="$s0" || g=="($s0)") return "10000";
	else if (g=="$s1" || g=="($s1)") return "10001";
	else if (g=="$s2" || g=="($s2)") return "10010";
	else if (g=="$s3" || g=="($s3)") return "10011";
	else if (g=="$s4" || g=="($s4)") return "10100";
	else if (g=="$s5" || g=="($s5)") return "10101";
	else if (g=="$s6" || g=="($s6)") return "10110";
	else if (g=="$s7" || g=="($s7)") return "10111";
	else if (g=="$t8" || g=="($t8)") return "11000";
	else if (g=="$t9" || g=="($t9)") return "11001";
	else return "";
}
string ShftFn(string h)
{
	if (h=="add") return "00000100000";
	if (h=="sub") return "00000100010";
	if (h=="and") return "00000100100";
	if (h=="nor") return "00000100111";
	if (h=="slt") return "00000101010";
}
void main()
{
	ifstream myfile;
	ifstream myfile1;
	ofstream thefile;
	myfile1.open("instruction.txt");
	int LineNumber=0,LineN=0;
	label LA;
	string Line,label,first,second,third,fourth,fifth,sixth;
	while(!myfile1.eof())
	{
		getline(myfile1,Line);
		int pos = Line.find(":");
		if(pos!=-1)
		{
			label=Line.substr(0,pos-1);
			thefile<<label<<endl;
			LA.addlabel(label,LineN);
		}
		LineN++;
	}
	myfile.open("instruction.txt");
	thefile.open("Machine.txt");
	while(!myfile.eof())
	{
		myfile>>first;myfile>>second;
		thefile<<OpCode(first);
		if(second == ":")
		{
			continue;
		}
		if(OpCode(first)=="000000") // R format
		{
			if(first=="sll")
			{
				myfile>>third;myfile>>fourth;myfile>>fifth;myfile>>sixth;
				thefile<<"00000";
				thefile<<reg(fourth);
				thefile<<reg(second);
				int c = atoi(sixth.c_str());
				bitset<5> x(c);
				thefile<<x;
				thefile<<"000000";
			}
			else if(first=="jr")
			{
				thefile<<reg(second);
				thefile<<"000000000000000001000";
			}
			else
			{
				myfile>>third;myfile>>fourth;myfile>>fifth;myfile>>sixth;
				thefile<<reg(fourth);
				thefile<<reg(sixth);
				thefile<<reg(second);
				thefile<<ShftFn(first);
			}
		}
		else if(OpCode(first)=="001000" || OpCode(first)=="001100") // andi or addi
		{
			myfile>>third;myfile>>fourth;myfile>>fifth;myfile>>sixth;
			thefile<<reg(fourth);
			thefile<<reg(second);
			int a = atoi(sixth.c_str());
			bitset<16> x(a);
			thefile<<x;
		}
		else if(OpCode(first)=="100011" || OpCode(first)=="101011") // lw or sw
		{
			myfile>>third;myfile>>fourth;myfile>>fifth;
			thefile<<reg(fifth);
			thefile<<reg(second);
			int b = atoi(fourth.c_str());
			bitset<16> y(b);
			thefile<<y;
		}
		else if(OpCode(first)=="000010" || OpCode(first)=="000011") // j or jal
		{
			int add = LA.getadd(second);
			bitset<26> z(add);
			thefile<<z;
		}
		else if(OpCode(first)=="000100") //beq
		{
			myfile>>third;myfile>>fourth;myfile>>fifth;myfile>>sixth;
			thefile<<reg(second);
			thefile<<reg(fourth);
			int add = LA.getadd(sixth);
			int AddOffset = add - (LineNumber + 1);
			bitset<16> z(AddOffset);
			thefile<<z;
		}
		LineNumber++;
		thefile<<endl;
	}
	cout<<"Assembling done..!"<<endl;
	system("pause");
}