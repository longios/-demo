//
//  ViewController.m
//  DynamicAnimation
//
//  Created by Abe on 2018/8/1.
//  Copyright © 2018年 Abe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong, nonatomic) UIView *aview;
@property(strong, nonatomic) UIView *bview;
@property(strong, nonatomic) UIDynamicAnimator *animator;

@property(strong, nonatomic) UIView *redPoint;

@property(strong, nonatomic) UIPanGestureRecognizer *panGesture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *aview = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    aview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:aview];
    self.aview = aview;
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.aview addGestureRecognizer:self.panGesture];
    
    UIView *bview = [[UIView alloc] initWithFrame:CGRectMake(100, 30, 50, 50)];
    bview.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:bview];
    self.bview = bview;
    
    UIView *redPoint = [[UIView alloc] initWithFrame:CGRectMake(200, 200, 1, 1)];
    redPoint.backgroundColor = [UIColor redColor];
    [self.view addSubview:redPoint];
    self.redPoint = redPoint;
    
//    UIDynamicAnimator;
//    UIDynamicBehavior;
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    self.animator = animator;
    // 重力
//    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.aview]];
//    [animator addBehavior:gravityBehavior];

    
    // 碰撞 （有边界）
//    UICollisionBehavior *pzBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.aview]];
//    pzBehavior.translatesReferenceBoundsIntoBoundary = YES;  // 设置边界
//    [animator addBehavior:pzBehavior];
    
    // 链接
//    UIAttachmentBehavior *attachBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.aview attachedToItem:self.bview];
//    [animator addBehavior:attachBehavior];
//    UIGravityBehavior *graBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.bview]];
//    [animator addBehavior:graBehavior];
//    UICollisionBehavior *pzBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.aview]];
//    pzBehavior.translatesReferenceBoundsIntoBoundary = YES;
//    [animator addBehavior:pzBehavior];
    
    
    // 链接  点
    
    
    //给一个推力 uipushbehavior
//    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[self.aview, self.bview] mode:UIPushBehaviorModeContinuous];
//
//    pushBehavior.action = ^{
//        NSLog(@"aview x : %f", self.aview.frame.origin.x);
//    };
//
//    [pushBehavior setPushDirection:CGVectorMake(1, 0)];
//    [pushBehavior setMagnitude:1.3];
//    [self.animator addBehavior:pushBehavior];
//
//    UICollisionBehavior *colisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[self.aview, self.bview]];
//    colisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
//    [self.animator addBehavior:colisionBehavior];
    
    
    // 弹簧阻尼动画
//    [UIView animateWithDuration:<#(NSTimeInterval)#> delay:<#(NSTimeInterval)#> usingSpringWithDamping:<#(CGFloat)#> initialSpringVelocity:<#(CGFloat)#> options:<#(UIViewAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>]
    
    //弹力 + uiattachmetn
//    UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc] initwith]
    
//    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[self.aview, self.bview] mode:UIPushBehaviorModeContinuous];
//    [pushBehavior setPushDirection:CGVectorMake(1, 0)];
//    [pushBehavior setMagnitude:0.1];
//
//    pushBehavior.action = ^{
//        NSLog(@"aview x : %f", self.aview.frame.origin.x);
//    };
//    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.aview, self.bview]];
//
//    itemBehavior.resistance = 0.2;
//    [self.animator addBehavior:pushBehavior];
//    [self.animator addBehavior:itemBehavior];
    
    
    
   
}

- (void)panGesture:(UIPanGestureRecognizer *)panRecognize {
    CGPoint point = [panRecognize translationInView:self.aview];
    switch (panRecognize.state) {
        case UIGestureRecognizerStateBegan:
        {
            [self.animator removeAllBehaviors];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            self.aview.frame = CGRectMake(self.aview.frame.origin.x, self.aview.frame.origin.y + point.y, self.aview.frame.size.width, self.aview.frame.size.height);
        }
            break;
        case UIGestureRecognizerStateCancelled :
        case UIGestureRecognizerStateEnded:
        {
            UIAttachmentBehavior *attachBehavior = [[UIAttachmentBehavior alloc] initWithItem:self.aview attachedToAnchor:CGPointMake(125, 125)];
            attachBehavior.damping = 1;
            attachBehavior.length = 0;
            attachBehavior.frequency = 1.6;
            [self.animator removeAllBehaviors];
            [self.animator addBehavior:attachBehavior];
        }
            break;
        default:
            break;
    }
    [panRecognize setTranslation:CGPointZero inView:self.aview];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    // 单点的吸附
//    UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:self.aview snapToPoint:point];
//    snapBehavior.damping = 0.5;
//    [self.animator removeAllBehaviors];
//    [self.animator addBehavior:snapBehavior];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
