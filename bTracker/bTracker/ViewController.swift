//
//  ViewController.swift
//  bTracker
//
//  Copyright © 2019 sam. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CBCentralManagerDelegate {
    @IBOutlet weak var tableView: UITableView!
    var btcManager : CBCentralManager? //bluetooth central manager
    var array_names : [String] = []
    var array_RSSI : [NSNumber] = []
    var timer : Timer? //only starts when bluetooth is available and working


    override func viewDidLoad() {
        super.viewDidLoad()
        btcManager = CBCentralManager(delegate: self, queue: nil)
    }


    //Refresh button:
    @IBAction func refreshTapped(_ sender: Any) {
       scan_start()
        scan_start()
    }
    
    func scan_start(){
        array_names = []
        array_RSSI = []
        tableView.reloadData()
        btcManager?.stopScan()
        btcManager?.scanForPeripherals(withServices: nil, options: nil)//both nil because we are looking for ALL types of bluetooth devices
    }
    
    func setTimer(){
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: { (Timer) in
            self.scan_start()
        })
    }
    
    
    //MARK: BTC Code:
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        //unwrapping optional":?
        if let name = peripheral.name{
            print("Device Name: \(name)")

        }
        //unwrap name:
        if let name = peripheral.name{
            array_names.append(name)
        }else{
            array_names.append(peripheral.identifier.uuidString)
        }
        array_RSSI.append(RSSI)
        tableView.reloadData()//updates data on screen
        //To console for logging:
        print("Device UUID: \(peripheral.identifier.uuidString)")
        print("Device RSSI: \(RSSI)")
        print("Ad Data: \(advertisementData)")
        print("---------------------------------")
    }
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn{ //working
            scan_start()
            setTimer()
        }else{//not working
            let alertVC = UIAlertController(title: "Bluetooth not working", message: "Make sure bluetooth is ready to rock and roll", preferredStyle: .alert)
           let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (action ) in
                alertVC.dismiss(animated: true, completion: nil)
        })
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
    }
    }
    //MARK: Table View Code
    
    //Returns number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array_names.count //cells = number of names in array
    }
    
    //Get cell from storyboard
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BTcell", for: indexPath) as? BTTableViewCell{
            cell.label_deviceName.text = array_names[indexPath.row]
            cell.label_RSSI.text = "RSSI: \(array_RSSI[indexPath.row])"
            return cell
        }
        return UITableViewCell()
    }
    
}

