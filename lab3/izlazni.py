import sys


if __name__ == "__main__":
    log_file = ""
    try:
        log_file = sys.argv[1]
    except IndexError:
        print('Exactly one argument required.')
        exit(1)
    with open(log_file) as f:
        lines = f.readlines()
    d = {}
    for line in lines:
        line = line.strip()
        ip = line.split()[0]
        net = ip.split('.')[0:2]
        net = '.'.join(net)
        size = line.split()[-1]
        try:
            size = int(size)
            d[net] = d[net] + size if net in d else size
        except ValueError:
            pass
    l = []
    for el in d:
        l.append((el, d[el]))
    l.sort(key=lambda t: t[1], reverse=True)
    print('--------------------------------')
    print('  IP adrese   |  Br. pristupa')
    print('--------------------------------')
    for el in l:
        print(f'{el[0]:>8s}.*.*   {el[1]:8d}')
    print('--------------------------------')
