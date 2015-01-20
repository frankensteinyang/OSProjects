//
//  ViewController.m
//  ZJBlueTooth
//
//  Created by Frankenstein Yang on 1/20/15.
//  Copyright (c) 2015 Frankenstein Yang. All rights reserved.
//

#import "ViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController () <CBCentralManagerDelegate, CBPeripheralDelegate>

@property (nonatomic, strong) CBCentralManager *centralM;
@property (nonatomic, strong) NSMutableArray *peripherals;

@property (nonatomic, strong) CBCharacteristic *dataInteraction;
@property (nonatomic, strong) CBCharacteristic *periphInfo;

@end

@implementation ViewController

#pragma mark - 懒加载
- (NSMutableArray *)peripherals {
    
    if (!_peripherals) {
        self.peripherals = [NSMutableArray array];
    }
    return _peripherals;
    
}

- (CBCentralManager *)centralM {
    
    if (!_centralM) {
        // 创建中心硬件管理者
        self.centralM = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    }
    return _centralM;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CBService *service;
//    CBCharacteristic *character;
    
    // 扫描外围硬件，nil是扫描所有
    /**
     *  苹果官方文档对两个参数的解释：
     serviceUUIDs
     An array of CBUUID objects that the app is interested in. In this case, each CBUUID object represents the UUID of a service that a peripheral is advertising.
     通过传入的一个存放服务UUID的数组进去，过滤掉非需外围硬件
     options
     An optional dictionary specifying options to customize the scan. For available options, see Peripheral Scanning Options.
     */
    // 唯一标识由硬件产家提供
    [self.centralM scanForPeripheralsWithServices:nil options:nil];
    
}

/**
 *  假设点击了手机上某一个按钮
 */
- (void)createConnect {

    for (CBPeripheral *peripherals in self.peripherals) {
        [self.centralM connectPeripheral:peripherals options:nil];
        
    }
}

#pragma mark - CBCentralManager的代理方法
/**
 *  发现外围硬件
 *
 *  @param central           <#central description#>
 *  @param peripheral        <#peripheral description#>
 *  @param advertisementData <#advertisementData description#>
 *  @param RSSI              <#RSSI description#>
 */
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {

    // 添加外围硬件
    if (![self.peripherals containsObject:peripheral]) {
        // 设置外围硬件的代理
        peripheral.delegate = self;
        [self.peripherals addObject:peripheral];
    }
    
}

/**
 *  连接到某个外围硬件
 *
 *  @param central    <#central description#>
 *  @param peripheral <#peripheral description#>
 */
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {

    // 查找外围的所有服务
    // 一旦查找到，就call外围硬件的代理的- (void)peripheral:didDiscoverServices:方法
    // 此处传入参数细节：通过传入的一个存放服务UUID的数组进去，过滤掉非需服务
    [peripheral discoverServices:nil];
    
    
}

/**
 *  与某个外围硬件失去连接
 *
 *  @param central    <#central description#>
 *  @param peripheral <#peripheral description#>
 *  @param error      <#error description#>
 */
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {

    
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {

    /**
     *  <#Description#>
     *
     *  @return <#return value description#>
     */
    
}

#pragma mark - CBPeripheral的代理方法
/**
 *  外围硬件找到服务
 *
 *  @param peripheral <#peripheral description#>
 *  @param error      <#error description#>
 */
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error {

    // 遍历所有服务
    for (CBService *service in peripheral.services) {
        // 过滤服务操作
        // 如果是所需的Frankenstein服务，再扫服务下面的特性，外围硬件会扫它里面所有（nil）的特性
        if ([service.UUID isEqual:@"Frankenstein"]) {
            // 找到就call代理的peripheral:didDiscoverCharacteristicsForService:error:方法
            // 此处参数传入数组，进行过滤操作[peripheral discoverCharacteristics:@[@"所需特性A", @"所需特性B"] forService:service];
            [peripheral discoverCharacteristics:nil forService:service];
        }
    }
    
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {

    // 有了服务中的特性后，遍历
    for (CBCharacteristic *characteristic in service.characteristics) {
        // 过滤掉不是Frankie的特性
        if ([characteristic.UUID isEqual:@"Frankie"]) {
            // 拿到特性，再按需做其他事
            self.dataInteraction = characteristic;
            [peripheral discoverCharacteristics:nil forService:service];
        } else if ([characteristic.UUID isEqual:@"硬件信息"]) {
            // 假设拿到硬件信息，做所需操作
            self.periphInfo = characteristic;
        }
    }
}

@end
