//
//  services.swift
//  QuotesIOS
//
//  Created by Osver Fernandez on 7/5/22.
//

import Foundation

class quoteService{
    static func getLocalData() -> [quotesStructure]{
        //Get json file path.
        let path = Bundle.main.path(forResource: "quotes", ofType: "json")
        
        //checks if path is nil. if so returns an empty instance of quotstructure.
        guard path != nil else{
            return [quotesStructure]() // Empty instance of the structure.
        }
        //if reaches here. we are sure that path is not nil.
            
            //creates a URL of the datapath provided.
            let url = URL.init(fileURLWithPath: path!) // we can force unwrap the optinonal path since we know its not nil. We verified above 'guard path...'
            
            //we must do & catch when trying to read the data inside the JSON file. If doesnt have the proper location above in 'let path...' then this will fail.
        do{
            //create data file to contain whatever we find in the url from above.
            let jsonData = try Data(contentsOf: url)
            
            //now we must decode the data (which is in json format)
            let decoder = JSONDecoder()
            
            //we must do and catch the decoder, bc it might fail if it cant match the quoteStructure and the JSON structure.
            do{
                //reads the json file, and puts it in the same structure as quoteStructure.
                let structuredData = try decoder.decode([quotesStructure].self, from: jsonData)
                
                //cycle through data array. and in each id, we give it a UUID.
                for r in structuredData{
                    r.id = UUID()
                }
                
                //data is complete. we can return the array.
                return structuredData
            }catch{
                print(error)
            }
            
            
        }catch{
            print(error)
        }
            

        
        return [quotesStructure]()
    }
}
