```C++

 * char * fgets (char * __s, int __n, FILE * __stream);
 * __s:表示缓存的数组
 * int __n:表示缓存的个数
 * __stream:表示打开的文件指针

int main()
{
    char buffer[MAX_INT] = {0};
    // cout << strlen(buffer) << endl;
    // cout << sizeof(buffer) << endl;
    int buffer2[100] = {1};
    // cout << strlen(buffer2) << endl;
    cout << sizeof(buffer2) << endl;
    FILE *stream;
    stream = fopen("C:\\Users\\gujiangqi\\Desktop\\test.txt", "r");
    if (stream == NULL)
    {
        printf("open error");
        exit(1);
    }

    // size_t size = strlen(buffer) * sizeof(char);
    while (!feof(stream))
    {
        memset(buffer, 0, sizeof(buffer));
        fgets(buffer, sizeof(buffer) - 1, stream);

        printf("%s", buffer);
    }
}

