#include <iostream>
#include <vector>
#include <sstream>
#include <bitset>
#include <unordered_map>

using namespace std;

vector<string> bloom_join(vector<string> &studentTable, vector<string> &courseTable)
{
    bitset<10> studentBit;
    bitset<10> courseBit;

    for (auto &row : studentTable)
    {
        stringstream ss(row);
        string stdid;
        getline(ss, stdid, ',');
        studentBit.set(stoi(stdid));
    }
    for (auto &row : courseTable)
    {
        stringstream ss(row);
        string stdid;
        getline(ss, stdid, ',');
        courseBit.set(stoi(stdid));
    }

    vector<string> result;
    for (auto &row : studentTable)
    {
        stringstream ss(row);
        string stdid, name, age;
        getline(ss, stdid, ',');
        getline(ss, name, ',');
        getline(ss, age, ',');
        if (studentBit.test(stoi(stdid)) && studentBit.test(stoi(stdid)))
        {
            for (auto &course : courseTable)
            {
                stringstream ss(course);
                string id, cname;
                getline(ss, id, ',');
                if (stoi(stdid) == stoi(id))
                {
                    getline(ss, cname, ',');
                    result.push_back(stdid + "," + name + "," + age + "," + cname);
                    break;
                }
            }
        }
    }
    return result;
}

int main()
{
    vector<string> studentTable = {
        "1, Akshay Kumar, 20",
        "2, Tiger Shroff, 21",
        "3, Vicky Kaushal, 22",
        "4, Salman Khan, 23"};

    vector<string> courseTable = {
        "1, ADE",
        "2, AI",
        "3, UOS",
        "4, PC"};
    vector<string> res = bloom_join(studentTable, courseTable);
    cout << "Stdid   Name    Age   Subject" << endl;
    for (auto &row : res)
    {
        cout << row << endl;
    }
    return 0;
}
