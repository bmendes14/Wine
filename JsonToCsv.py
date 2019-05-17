import csv, json, sys

def read_json(filename):
    return json.loads(open(filename).read())
def write_csv(data,filename):
    with open(filename, 'w+') as outf:
        writer = csv.DictWriter(outf, data[0].keys())
        writer.writeheader()
        for row in data:
            writer.writerow(row)
# implement
write_csv(read_json('wines.json'), 'data.csv')