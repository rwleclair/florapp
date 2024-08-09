import re

pat = {
        'taxon': re.compile(r'#Taxon:\n'),
        'EOB': re.compile(r'}}&lt;!--\n'),
        'name': re.compile(r'name=(?P<name>.*)\n'), 
        'rank': re.compile(r'(?<![\s])rank=(?P<rank>.*)\n'),
        'superorder': re.compile(r'(?<=super)order=(?P<superorser>.*)\n'),
        'order': re.compile(r'(?<!super)order=(?P<order>.*)\n'),
        'family': re.compile(r'(?<!sub)family=(?P<family>.*)\n'),
        'subfamily': re.compile(r'(?<=sub)family=(?P<subfamily>.*)\n'),
        'tribe': re.compile(r'(?<!sub)tribe=(?P<tribe`>.*)\n'),
        'subtribe': re.compile(r'(?<=sub)family=(?P<subfamily>.*)\n'),
        'gennus': re.compile(r'genus=(?P<genus>.*)\n'),
        'section': re.compile(r'section=(?P<section>.*)\n'),
        'species': re.compile(r'(?<!sub)species=(?P<species>.*)\n'),
        'subspecies': re.compile(r'(?<=sub)species=(?P<subspecies>.*)\n'),
        'variety': re.compile(r'variety=(?P<variety>.*)\n'),
}

def _line_parse(line):
    for key, val in pat.items():
        match = val.search(line)
        if match:
            return key, match
    return None, None

def taxon_parse():
    taxon_file = open('/home/ryan/Downloads/1.xml', 'r')
    line = taxon_file.readline()
    while line:
        key, match = _line_parse(line)
        if key == 'taxon':
            while key != 'EOB' and line:
                key, match = _line_parse(line)
                if key == 'name':
                    name = match.group('name')
                    print(name)
                if key == 'rank':
                    rank = match.group('rank')
                    print('rank: ', rank)
                if key == 'family':
                    family = match.group('family')
                    print('Family: ', family)
                if key == 'subfamily':
                    subfamily = match.group('subfamily')
                    print('Subfamily: ', subfamily)
                if key == 'genus':
                    genus = match.group('genus')
                    print('Genus: ', genus)
                if key == 'species':
                    species = match.group('species')
                    print('Species: ', species)
                if key == 'subspecies':
                    subspecies = match.group('subspecies')
                    print('Subspecies: ', subspecies)
                if key == 'variety':
                    variety = match.group('variety')
                    print('Variety: ', variety)
                line = taxon_file.readline()
        line = taxon_file.readline()
        # if key == 'name':
        #     name = match.group('name')
        #     print(name)
        # if key == 'rank':
        #     rank = match.group('rank')
        #     print(rank)
        # line = taxon_file.readline()

if __name__ == '__main__':
    taxon_parse()

