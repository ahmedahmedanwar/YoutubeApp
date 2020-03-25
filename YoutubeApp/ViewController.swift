//
//  ViewController.swift
//  YoutubeApp
//
//  Created by Ahmed on 3/24/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
 
    var videos: [Videos] = []
        var video: Videos = Videos()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let video = Videos()
        video.key = "WEzVpZXyTZ0"
        video.title = "iOS 13.4 is Out! - What's New?"
        videos.append(video)
        
        
        let video2 = Videos()
        video2.key = "SKBGvV9LW58"
        video2.title = "iPhone 11: My Honest Opinion After Two Months"
        videos.append(video2)
        
        
        let video3 = Videos()
        video3.key = "hjfUrKxM1ds"
        video3.title = "Fake IPhone BETTER than the REAL????"
        videos.append(video3)
        
        
        let video4 = Videos()
        video4.key = "v_5KcoSwmg4"
        video4.title = "Steve Jobs PISSED OFF moments 1997 2010"
        videos.append(video4)
        
        
        
        let video5 = Videos()
    video5.key = "sX1Y2JMK6g8"
    video5.title = "SpaceX Falcon Heavy- Elon Musk's Engineering Masterpiece"

        videos.append(video5)
        
        let video6 = Videos()
        video6.key = "wbSwFU6tY1c"
        video6.title = "Falcon Heavy Test Flight"
        videos.append(video6)
        
        
          let video7 = Videos()
        video7.key = "hh6xTguRn9o"
        video7.title = "Bill Gates explains how vaccines work"

            videos.append(video7)
        
        
   //     tableView.reloadData()
    }
    
}
class Videos {
    
    var key:String = ""
    var title:String = ""
}
extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! VideoTableViewCell
        cell.videoTitle.text = videos[indexPath.row].title
        let url = "https://img.youtube.com/vi/\(videos[indexPath.row].key)/0.jpg"
        cell.videoImage.downloaded(from: url)
        
        //UIImage(named: String(videos[indexPath.row].key))
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vi = videos[indexPath.row]
        self.video = vi
              
              performSegue(withIdentifier: "toVideo", sender: nil)
              
          }
          
          override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              
              if segue.identifier == "goToVideo" {
                  
                let vc = segue.destination as!
                    VideoViewController
                  vc.video = self.video
                  
              }
              
    }
    
}
extension UIImageView{
    
    func downloaded(from url: URL,contentmode mode:UIView.ContentMode = .scaleAspectFit){
        contentMode = mode
        
        URLSession.shared.dataTask(with: url){
            data, response, error in
            guard
                
                let data = data ,error == nil ,
                let httpURLResponse = response as? HTTPURLResponse , httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"), //(prefix: StringProtocol)
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async {
                self.image = image
            }
            
        }.resume()
        
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url  = URL(string: link) else {
            return }
        
        downloaded(from: url, contentmode: mode)
    }
    
    
}
