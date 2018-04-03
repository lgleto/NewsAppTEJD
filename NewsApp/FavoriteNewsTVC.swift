//
//  FavoriteNews.swift
//  NewsApp
//
//  Created by Lourenço Gomes on 03/04/18.
//  Copyright © 2018 Lourenço Gomes. All rights reserved.
//

import UIKit
import CoreData

class FavoriteNewsTVC: CoreDataTableViewController {
    
    //let dias : [String] = ["segunda","terça","quarta","quinta","sexta"]
    
    private var context : NSManagedObjectContext? {
        didSet{
            updateUI()
        }
    }
    
    
    
    //var newsArray : [News] = []
    
    func updateUI(){
        if let ctx = context {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "News")
            request.predicate = NSPredicate(format: "isFavorite=true" )
            request.sortDescriptors = [
                NSSortDescriptor(key: "title", ascending: true)
            ]
            
            fetchedResultsController =  NSFetchedResultsController(
                fetchRequest: request,
                managedObjectContext: ctx,
                sectionNameKeyPath: nil,
                cacheName: nil)
            
        }else{
            fetchedResultsController = nil
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate{
            context = appDelegate.persistentContainer.viewContext
            let httpRequest = HttpRequest.sharedInstance
            httpRequest.getAllNews(endpoint: ENDPOINT_SPORTS) { resultArrayDict in
                //print("result:\(resultStr)")
                for dict in resultArrayDict {
                    //let news : News = News.newsFromDictionary(dict)
                    //self.newsArray.append(news)
                    //print (news)
                    if let ctx = self.context {
                        let _ = News.addNewsFromDictionary(dict, context: ctx)
                    }
                }
                
            }
        }
        
        //new object
        //let httpRequest = HttpRequest()
        
        //singleton
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return fetchedResultsController?.sections?.count ?? 1
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : NewsTVCell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsTVCell
        
        if let news = fetchedResultsController?.object(at: indexPath) as? News {
            cell.labelTitle.text = news.title
            cell.labelDescription.text = news.detail
            // Configure the cell...
            if let urlStr = news.urlToImage {
                if let url = URL(string: urlStr)  {
                    URLSession.shared.dataTask(with: url, completionHandler: { (data, respose, error) in
                        if let dataImage = data {
                            DispatchQueue.main.async {
                                cell.newsImageView.image = UIImage(data: dataImage)
                            }
                        }
                    }).resume()
                    
                }
            }
            
        }
        
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let newsDetailVC  : NewsDetailVC = segue.destination as? NewsDetailVC {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                //newsDetailVC.news = newsArray[indexPath.row]
                newsDetailVC.news = self.fetchedResultsController?.object(at: indexPath) as! News
            }
            
            
        }
        
    }
    
    
}

