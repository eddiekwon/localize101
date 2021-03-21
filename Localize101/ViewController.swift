//
//  ViewController.swift
//  Localize101
//
//  Created by muzna on 2021/03/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var nationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         
        checkLangBundleFiles()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     
        helloLabel.text = "Hello".localizedDefault()
        //nationLabel.text = "나라이름".localized(lang: "en")
        nationLabel.text = "나라이름".localized()
    }
    
    func checkLangBundleFiles() {
        
        guard let pathEnglish = Bundle.main.path(forResource: "en", ofType: "lproj") else {
            return
        }
        print("ko path:\(pathEnglish)")
        
        guard let pathKo = Bundle.main.path(forResource: "ko", ofType: "lproj") else {
            return
        }
        print("en path:\(pathKo)")
         
    }
   
    
}
 
extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        //table을 찾아볼 때 값이 없다면. 즉 번역이 누락되었 있다면 value값이 표기됨
        return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "**\(self)**", comment: "")
    }
}

func changeLanuguage(langAbbr: String) {
    let savingKey = "key_bundle.languagePrefix"
    let defaults = UserDefaults.standard
    defaults.setValue(langAbbr, forKey: savingKey)
}
extension String {
    
    // 잘 동작하지만. parameter로 매번 lang을 넣어주어야 함.
    //usage: helloLabel.text = "Hello".localized(lang: "en")
    func localized(lang: String) -> String {
        
        guard let path = Bundle.main.path(forResource: lang, ofType: "lproj") else {
            return "*** wrong lproj"
        }
        guard let bundle = Bundle(path: path) else {
            return "*** bundle wrong"
        }
         
        return NSLocalizedString(self , tableName: nil, bundle: bundle, value: "", comment: "")
    }
    
    // userDefault기반으로 저장된 언어에 대한 Localized String을 구함
    func localizedDefault() -> String {

        let savingKey = "key_bundle.languagePrefix"
        let defaults = UserDefaults.standard
        
        if let savedLangPrefixValue = defaults.string(forKey: savingKey) {
            let localizedStringFound = localized(lang: savedLangPrefixValue)
            return localizedStringFound
        }
        
        defaults.setValue("ko", forKey: savingKey)
        return localized(lang:"ko")
    }
    
    /*
     en과 ko를 가져와서 bundle을 구하고.
     userdefault에 값이 없으면 현재 언어팩을 가져와서 userDefaults에 저장시킴.
     이때 이름은 Userdefaults.bundle.languagePrefix라 가정하자.
     
     userDefaults에
     
     */
    
    func getCurrentLanguage() {
        
        
    }
}
/*
 
 ref: https://hcn1519.github.io/articles/2017-03/iOS_LanguageSupport
 */
extension ViewController {
    func testArgs() {
        let myName = "Sam"
        let friend = "Tom"
        let myNum = 10
        
        helloLabel.text = String(format: NSLocalizedString("Hello %@, This is %@", comment: ""), myName, friend) // Hello Sam, This is Tom
        helloLabel.text = String(format: NSLocalizedString("Hello %d", comment: ""), myNum) // Hello 10
    }
}
 
/*
 폴더에 가보면
 en.lproj
 ko.lproj
 등이 보일 것임
 */

extension Bundle {
    private static var hello = "ssss"
}
