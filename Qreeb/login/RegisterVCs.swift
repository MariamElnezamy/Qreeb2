//
//  loginViewController.swift
//  
//
//  Created by Admin on 8/8/19.
//


import UIKit
import Alamofire
import SwiftyJSON

class RegisterVCs: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    // view1 for Delivery
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var phoneTF: UITextField!
    @IBOutlet var accountNumTF: UITextField!
    @IBOutlet var bankNum: UITextField!
    @IBOutlet var ownsBankNameTF: UITextField!
    
    // view2 for Client
    @IBOutlet var name2TF: UITextField!
    @IBOutlet var phone2TF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var adressTF: UITextField!
    
    lazy var imagePickerHelper: ImagePickerHelper  = {
        let imagePickerHelper = ImagePickerHelper(viewController: self, sourceType: .camera)
        return imagePickerHelper
    }()
    
    
    var nameArr:[String]=["صورة الرخصة الشخصية*","صورة الهوية*","صورة للمركبة (من الخلف)*","صورة للمركبة (من الامام)*","صورة شخصية*","صورة الاستمارة*","صورة بيانات البنك (في حالة وجود حساب بنكي رجاء تعبئة البيانات)*"]
    
    var pickerPicArr = [UIImage]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! repPicCollectionViewCell
        cell.picName.text=nameArr[indexPath.row]
            if selectedImages[indexPath] == nil {
                cell.Pic.image = UIImage(named: "photo")
            } else {
                cell.Pic.image = selectedImages[indexPath]
            }
        return cell
    }
    var currentIndexPath = 0
    var indexArr:[Int] = [0,1,2,3,4,5]
    
    var selectedImages: [IndexPath: UIImage ] = [:]
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentIndexPath = indexArr[indexPath.row]
        if indexArr[indexPath.row] == 2 || indexArr[indexPath.row] == 3  {
            
            let title = "Choose Image".localized()
            let message = "Need To Choose Image".localized()
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let Camera = UIAlertAction(title: "Galary".localized(), style: .default, handler: {  [weak self](action)-> Void in
                guard let self = self else { return }
                self.imagePickerHelper.presentImagePicker()
                self.imagePickerHelper.imageSelected = { [weak self] image in
                    guard let self = self else { return }
                    self.selectedImages[indexPath] = image
                    self.myCollectionView.reloadData()
                }
            })
            
            alertController.addAction(Camera)
            present(alertController, animated: true, completion: nil)
            
        }else{
            let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
            let cameraAction = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default) {
                UIAlertAction in
                self.openCamera(UIImagePickerController.SourceType.camera)
            }
            let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertAction.Style.default) {
                UIAlertAction in
                self.openCamera(UIImagePickerController.SourceType.photoLibrary)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) {
                UIAlertAction in
            }
            imagePicker.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
            alert.addAction(cameraAction)
            alert.addAction(gallaryAction)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        

    }
    
  //  image picker
    

   var imagePicker = UIImagePickerController()

    func openCamera(_ sourceType: UIImagePickerController.SourceType) {
        imagePicker.sourceType = sourceType
        self.present(imagePicker, animated: true, completion: nil)
    }
    

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! repPicCollectionViewCell
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
//        cell.Pic.image = image
        pickerPicArr.append(image!)
  //      self.myCollectionView.reloadItems(at: pickerPicArr[indexPAth.row])
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    @IBOutlet var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = self.myCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset  = UIEdgeInsets(top: 0,left: 20,bottom: 0,right: 30)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width:( self.myCollectionView.frame.size.width - 20)/2, height: 170)
        
        MyView2.isHidden=true
        MyView1.isHidden=false
        
    }
    
    @IBOutlet var mySegmentController: UISegmentedControl!
    
    @IBOutlet var MyView1: UIView!
    @IBOutlet var MyView2: UIView!
    
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        
        let getIndex = mySegmentController.selectedSegmentIndex
        
        switch getIndex {
        case 0:
            
            MyView1.isHidden=false
            MyView2.isHidden=true
            
        case 1:
            
            MyView1.isHidden=true
            MyView2.isHidden=false
        default:
            MyView1.isHidden=true
            MyView2.isHidden=false
        }
        
        
    }
    
    
    @IBAction func loginAsClient(_ sender: Any) {
//
//        UserDefaults.standard.set("TTTttttt", forKey: "Token")
//
//        let token: String = UserDefaults.standard.value(forKey: "Token") as! String
//        print(token)
//        
//        UserDefaultsHelper().saveObject("TtTTTTTTTTTT", forKey: "Token2")
//        let token: String = UserDefaultsHelper().getObject(forKey: "Token2")  ?? "" as String
//                print(token)

        
        
        API.loginAsClient(name: name2TF.text!, phone: phone2TF.text!, email: emailTF.text!, addresses: adressTF.text!) { (error:Error?, success:Bool) in
            if success {
                print("success")
            }
        }
        
        guard let name = name2TF.text, name.isEmpty else{
            let alert = UIAlertController(title: "عذرا !", message: "ادخل الاسم", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            self.present(alert, animated: true)
            return
        }
        guard let phone = phone2TF.text, phone.isEmpty else{
            let alert = UIAlertController(title: "عذرا !", message: "ادخل رقم الموبيل", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            self.present(alert, animated: true)
            return
        }
        guard let email = emailTF.text, email.isEmpty else{
            let alert = UIAlertController(title: "عذرا !", message: "ادخل الايميل", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            self.present(alert, animated: true)
            return
        }
        guard let adress = adressTF.text, adress.isEmpty else{
            let alert = UIAlertController(title: "عذرا !", message: "ادخل العنوان", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            self.present(alert, animated: true)
            return
        }
        
    

    }
    
    
    @IBAction func loginAsDelivery(_ sender: Any) {
        
        API.loginAsDelivery(name: nameTF.text!, phone: phoneTF.text!, bank_no: accountNumTF.text!, account_name: bankNum.text!, bank_name: ownsBankNameTF.text!) { (error:Error?, success:Bool) in
            if success {
                print("success")
            }
        }
        
        
        guard let name = nameTF.text, name.isEmpty else{
            let alert = UIAlertController(title: "عذرا !", message: "ادخل الاسم", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            self.present(alert, animated: true)
            return
        }
        guard let phone = phoneTF.text, phone.isEmpty else{
            let alert = UIAlertController(title: "عذرا !", message: "ادخل الرقم", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            self.present(alert, animated: true)
            return
        }
        guard let accountNum = accountNumTF.text, accountNum.isEmpty else{
        let alert = UIAlertController(title: "عذرا !", message: "ادخل رقم الحساب", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
        self.present(alert, animated: true)
        return
    }
        guard let bankNums = bankNum.text, bankNums.isEmpty else{
            let alert = UIAlertController(title: "عذرا !", message: "ادخل اسم البنك  ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            self.present(alert, animated: true)
            return
        }
        guard let ownsBankName = ownsBankNameTF.text, ownsBankName.isEmpty else{
            let alert = UIAlertController(title: "عذرا !", message: "ادخل اسم صاحب الحساب ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            self.present(alert, animated: true)
            return
        }
        
        
    }
    
}
