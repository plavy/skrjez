import sys
import urllib.request
import re


if __name__ == "__main__":
    try:
        site = sys.argv[1]
    except IndexError:
        print("Exactly one argument required.")
        sys.exit(1)
    try:
        site = urllib.request.urlopen(site)
    except:
        print("Please specify valid and full URL.")
        sys.exit(1)
    site_bytes = site.read()
    try:
        site_text = site_bytes.decode("utf8")
    except UnicodeError:
        print("Internal error: Problem with decoding site, please try another")
        sys.exit(1)
    links = re.findall(r'href="(.*?)"', site_text)
    hosts = re.findall(r'https?://(.*?)/', '\n'.join(links))
    emails = re.findall(r'[\w\d.-]+@[\w\d.-]+\.\w+', site_text)
    imgs = re.findall(r'<img src=".*?".*?>', site_text)
    host_d = {}
    for el in hosts:
        host_d[el] = host_d[el] + 1 if el in host_d else 1
    print("-- Raw HTML:")
    print(site_text)
    print("\n-- Links:")
    for el in links:
        print(el)
    print("\n-- Hosts:")
    for el in host_d:
        print(el, host_d[el])
    print("\nEmails:")
    for el in set(emails):
        print(el)
    print(f"\nImages: {len(imgs)}")
