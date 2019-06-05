//
//  ViewController.swift
//  new0507
//
//  Created by Green on 07/05/18.
//  Copyright © 2018 Greens. All rights reserved.
//

import UIKit

class firstTableViewController: UITableViewController  {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifierX1", for: indexPath) as! firstTableViewCell
       // cell.textLabel?.text = name [indexPath.row]
        //cell.imageViewX1.image =
        cell.labelX1.text = name [indexPath.row]
       
        
        
        let urlX = URL(string: imageURL [indexPath.row])
        
        let dataX = try?Data(contentsOf: urlX!)
        
        cell.imageViewX1.image = UIImage(data: dataX!)

        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    var link = "https://www.myprivatedeal.com/API/getDeals.php?key=jcjn79b8f043f4y74yh48ug984u"
    var name = [String] ()
    var imageURL = [String] ()
   


    
    @IBOutlet var tableViewX1: UITableView!

    
    
    override func viewDidLoad() {
        
        let url = URL(string: link)
        
        URLSession.shared.dataTask(with: url!) {(data,response, error) in
            if error != nil
            {
                print(error!)
            }else{
                print ("abcd")
                //                print (response)
                //                print (error)
                //                print ("test",data)
                do{
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any]
                    {
                        
                        
                       
                        
                        let myarray = json["Deal"] as! NSArray
                        for ssss in myarray
                        {
                            if let titlePath = ssss as?[String: Any]
                            {
                                
                                self.name.append(titlePath["title"] as! String)
                            }
                            
                            if let imagePath = ssss as?[String: Any]
                            {
                                
                                self.imageURL.append(imagePath["cat_icon"] as! String)
                            }
                            
                        }
                        DispatchQueue.main.async {
                            self.tableViewX1.reloadData()
                        }
                    }
                }catch let error as NSError{
                    print(error)
                }
            }
            }.resume()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

