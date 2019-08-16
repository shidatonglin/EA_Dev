
class Person{
	public:
		Person();
		Person(string,int);
		~Person();
		void PrintInfo();
	private:
		string m_name;
		int    m_age;
};

Person::Person(){

}

Person::Person(string name, int age){
	m_name = name;
	m_age = age;
}

Person::~Person(){

}

void Person::PrintInfo(){
	Print("my name : ", m_name, "\n my age", m_age);
}