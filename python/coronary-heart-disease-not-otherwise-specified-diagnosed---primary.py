# Kuan V, Denaxas S, Gonzalez-Izquierdo A, Direk K, Bhatti O, Husain S, Sutaria S, Hingorani M, Nitsch D, Parisinos C, Lumbers T, Mathur R, Sofat R, Casas JP, Wong I, Hemingway H, Hingorani A, 2024.

import sys, csv, re

codes = [{"code":"15754","system":"readv2"},{"code":"29421","system":"readv2"},{"code":"24783","system":"readv2"},{"code":"68401","system":"readv2"},{"code":"34633","system":"readv2"},{"code":"7320","system":"readv2"},{"code":"52517","system":"readv2"},{"code":"27977","system":"readv2"},{"code":"20416","system":"readv2"},{"code":"240","system":"readv2"},{"code":"11648","system":"readv2"},{"code":"1344","system":"readv2"},{"code":"39693","system":"readv2"},{"code":"27951","system":"readv2"},{"code":"28138","system":"readv2"},{"code":"23078","system":"readv2"},{"code":"22383","system":"readv2"},{"code":"35713","system":"readv2"},{"code":"95550","system":"readv2"},{"code":"10260","system":"readv2"},{"code":"18889","system":"readv2"},{"code":"5413","system":"readv2"},{"code":"9413","system":"readv2"},{"code":"18135","system":"readv2"},{"code":"47637","system":"readv2"},{"code":"55137","system":"readv2"},{"code":"1792","system":"readv2"},{"code":"21844","system":"readv2"},{"code":"1676","system":"readv2"},{"code":"61072","system":"readv2"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('coronary-heart-disease-not-otherwise-specified-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["coronary-heart-disease-not-otherwise-specified-diagnosed---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["coronary-heart-disease-not-otherwise-specified-diagnosed---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["coronary-heart-disease-not-otherwise-specified-diagnosed---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
