import sys


def ucitaj_matricu(lines):
    n = -1
    m = -1
    d = dict()
    for el in lines:
        units = el.split()
        if n == -1:
            if not len(units) == 2:
                print('Invalid format for matrix dimension')
                exit(2)
            try:
                n = int(units[0])
                m = int(units[1])
            except ValueError:
                print('Matrix dimension should be 2 integers')
                exit(2)
        else:
            if not len(units) == 3:
                print('Invalid index format')
                exit(2)
            try:
                x = int(units[0])
                y = int(units[1])
                if x >= n or y >= m:
                    print(f'Invalid index: {x, y}')
                    exit(2)
                try:
                    v = float(units[2])
                    d[(x, y)] = v
                except ValueError:
                    print('Value should be float')
                    exit(2)
            except ValueError:
                print('Index should be 2 integers')
                exit(2)
    return d, n, m


def ispisi_matricu(tuple):
    d = tuple[0]
    n = tuple[1]
    m = tuple[2]
    for x in range(n):
        for y in range(m):
            if not (x, y) in d:
                print(f'{0:6.2f}', end=' ')
            else:
                print(f'{d[(x, y)]:6.2f}', end=' ')
        print()


def zapisi_matricu(tuple):
    d = tuple[0]
    n = tuple[1]
    m = tuple[2]
    lines = [' '.join([str(n), str(m)]) + '\n']
    for x in range(n):
        for y in range(m):
            v = d[(x, y)] if (x, y) in d else 0
            if not v == 0:
                lines.append(' '.join([str(x), str(y), f'{v:.2f}']) + '\n')
    return lines


def pomnozi_matrice(t1, t2):
    d1 = t1[0]
    n1 = t1[1]
    m1 = t1[2]
    d2 = t2[0]
    n2 = t2[1]
    m2 = t2[2]
    if not m1 == n2:
        print('Incompatible matrices')
        exit(2)
    d = {}
    n = n1
    m = m2
    for x in range(n):
        for y in range(m):
            sum = 0.0
            for i in range(m1):
                el1 = d1[(x, i)] if (x, i) in d1 else 0
                el2 = d2[(i, y)] if (i, y) in d2 else 0
                sum += el1 * el2
            if not sum == 0.0:
                d[(x, y)] = sum

    return d, n, m


if __name__ == "__main__":
    try:
        read_file = sys.argv[1]
        write_file = sys.argv[2]
    except IndexError:
        print("Exactly two arguments required.")
        sys.exit(1)
    with open(read_file) as f:
        lines = f.readlines()
    lines_temp = []
    a = ()
    b = ()
    for el in lines:
        el = el.strip()
        if not el == "":
            lines_temp.append(el)
        else:
            a = ucitaj_matricu(lines_temp)
            lines_temp.clear()
    b = ucitaj_matricu(lines_temp)
    print('\nA:')
    ispisi_matricu(a)
    print('\nB:')
    ispisi_matricu(b)
    c = pomnozi_matrice(a, b)
    print('\nA*B:')
    ispisi_matricu(c)
    lines = zapisi_matricu(c)
    with open(write_file, 'w') as f:
        f.writelines(lines)
