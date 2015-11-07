//
//  SelectCountryPage.swift
//  Uber
//
//  Created by 于东兴 on 15/11/7.
//  Copyright © 2015年 EricYU. All rights reserved.
//

import UIKit
class SelectCountryPage: UberBaseViewController {

    //MARK:Property
    private var countrys : [CountryInfo]?
    private var headers : [String]?
    private var dictsDatas : [String:AnyObject]?
    
    @IBOutlet weak var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "选择国家/地区"
        
        setNavigationItem("取消", selector: "doBack", isRight: false)
        self.initCountry()
        self.initDatas()
        
        print("dic:\(dictsDatas)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:private Methods 
    private func initCountry(){
        
        let arrcodes = NSLocale.ISOCountryCodes()
        
        let currentcodes = NSLocale.currentLocale()
        
        var info : CountryInfo!
        countrys = []
        
        for code in arrcodes {
            info = CountryInfo()
            info.code = code
            info.name = currentcodes.displayNameForKey(NSLocaleCountryCode, value: code)
        
            countrys?.append(info)
        }
        
       // 排序
        countrys?.sortInPlace({ (arg1:CountryInfo, arg2:CountryInfo) -> Bool in
            return arg1.name.localizedCaseInsensitiveCompare(arg2.name) == .OrderedAscending
        })
        

    }
    
    //A...Z 
    private func initDatas(){
        var firstLetter : String!
        var datas : [CountryInfo] = []
        
        headers = []
        dictsDatas = [:]
        
        for country in countrys! {
            
            var stringTool = StringTools()
            
            firstLetter = stringTool.firstCharactor(country.name)
            if !(headers!.contains(firstLetter)){
                if datas.count > 0 {
                    dictsDatas![headers!.last!] = datas
                }
                headers?.append(firstLetter)
                datas = []
            }
            datas.append(country)
        }
        dictsDatas![headers!.last!] = datas
    }


}
extension SelectCountryPage : UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return headers!.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = headers![section]
        let datas = dictsDatas![key] as! [CountryInfo]
        return datas.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identity = "countryCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identity, forIndexPath: indexPath) as! UITableViewCell
        let key = headers![indexPath.section]
        let datas = dictsDatas![key] as! [CountryInfo]
        let country = datas[indexPath.row]
        
        cell.accessoryType = .None
        cell.textLabel?.text = country.name
        
        
        return cell
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers![section]
    }
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return headers
    }
}
