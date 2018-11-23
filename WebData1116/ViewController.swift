//
//  ViewController.swift
//  WebData1116
//
//  Created by 503-16 on 2018. 11. 16..
//  Copyright © 2018년 the. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //문자열을 가져올 URL을 생성
        let url = URL(string: "https://www.daum.net")
        //데이터 가져오기
        let data = try! Data(contentsOf: url!)
        //콘솔에 출력
        //print(data)
        
        //문자열로 변환해서 출력
        let daumString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        print(daumString!)
        
        //파일 매니저 객체를 생성
        let fm = FileManager.default
        //도큐먼트 디렉토리 경로를 생성
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docDir = dirPaths[0]
        //파일 경로를 생성
        let filePath = docDir + "/suzi.jpg"
        
        //파일이 없다면
        if fm.fileExists(atPath: filePath) == false{
        //이미지 파일의 내용을 다운로드 받기
        let addr = "https://fscomps.fotosearch.com/compc/CSP/CSP994/%EB%A1%B1%EB%B9%84%EC%B9%98-%EC%BA%98%EB%A6%AC%ED%8F%AC%EB%8B%88%EC%95%84-%EC%A7%80%ED%8F%89%EC%84%A0-%EC%97%90%EC%84%9C-%EC%86%90%EB%B0%94%EB%8B%A5-%EB%82%98%EB%AC%B4-%EC%9D%98-%ED%95%AD%EA%B5%AC-%EC%8A%A4%ED%86%A1-%EC%9D%B4%EB%AF%B8%EC%A7%80__k15952576.jpg"
            let imageUrl = URL(string: addr)
            let imageData = try! Data(contentsOf: imageUrl!)
            //다운로드 받은 데이터로 파일을 생성
            fm.createFile(atPath: filePath, contents: imageData, attributes: nil)
            print("다운로드")
        }
        let dataBuffer = fm.contents(atPath: filePath)
        //이미지 데이터로 변환
        let image = UIImage(data: dataBuffer!)
        //화면에 출력
        imgView.image = image
    }
    
    
}

