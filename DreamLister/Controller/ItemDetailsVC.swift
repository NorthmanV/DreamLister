//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Руслан Акберов on 04.11.2017.
//  Copyright © 2017 Ruslan Akberov. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    var stores = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        storePicker.delegate = self
        storePicker.dataSource = self
        titleField.delegate = self
        priceField.delegate = self
        detailsField.delegate = self
        //generateStores()
        getStores()

        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // update when selected
    }
    
    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            let error = error as NSError
            print(error.description)
        }
    }
    
    func generateStores() {
        let store = Store(context: context)
        store.name = "EBay"
        let store2 = Store(context: context)
        store2.name = "MediaMarkt"
        let store3 = Store(context: context)
        store3.name = "MegaFon"
        let store4 = Store(context: context)
        store4.name = "MVideo"
        let store5 = Store(context: context)
        store5.name = "OnlineTrade"
        let store6 = Store(context: context)
        store6.name = "Ulmart"
        ad.saveContext()
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        let item = Item(context: context)
        if let title = titleField.text {
            item.title = title
        }
        if let price = priceField.text {
            if let doublePrice = Double(price) {
                item.price = doublePrice
            }
        }
        if let details = detailsField.text {
            item.details = details
        }
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        ad.saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}















