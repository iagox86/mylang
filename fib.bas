f = 4;

i = 1;
j = 1;

while(f > 0)
{
  t = i;

  i = i + j;
  j = t;

  f = f - 1;
}

print(i);
