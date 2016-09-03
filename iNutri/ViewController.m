//
//  ViewController.m
//  iNutri
//
//  Created by Jose on 9/2/16.
//  Copyright © 2016 robert. All rights reserved.
//

#import "ViewController.h"
#import "newViewController.h"
#import "AppDelegate.h"
#import "UserMainViewController.h"
#import "ForgotPassViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@implementation ViewController

@synthesize username, password, myUsers,mail, correos,fbb,rememberMeOutlet;
NSMutableData *webData;


NSString *jj;
NSString *firstRegister;
int w;
NSString *loginfb;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
   webData = [NSMutableData data];
    myUsers = [NSMutableArray new];
    correos = [NSMutableArray new];
    [correos addObject:@"rovert727@hotmail.com"];
    
    //NSString *url = @"http://166.78.30.215/app/users.json";
    NSString *url = @"http://166.78.30.215/nutricion2/users.json";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
    if(!connection){
        NSLog(@"Hubo un error");
    }
    
    loginfb = loginButton.titleLabel.text;

   
ToRead:
    jj=([[NSUserDefaults standardUserDefaults]objectForKey:@"loginStatus"]);
    firstRegister=([[NSUserDefaults standardUserDefaults]objectForKey:@"firstRegister"]);
   //rover puto
    //NSLog([[NSUserDefaults standardUserDefaults]objectForKey:@"firstRegister"]);
    
//    if ([jj isEqualToString:@"alreadyLogin"]) {
//        UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
//        [self presentViewController:tabBarController animated:YES completion:nil];
//        //NSLog(@"ya se habia logueado");
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {

    int i;
    int flag=0;
    for (i=0; i<[myUsers count]; i++) {
        
    NSDictionary *user = [[myUsers objectAtIndex:i] valueForKey:@"User"];
    
    
    if ([username.text isEqualToString:[user valueForKey:@"username"]] &&
        [password.text isEqualToString:[user valueForKey:@"password"]]) {
        flag=1;
        NSLog(@"id:%@",[user valueForKey:@"id"]);
        
        [[NSUserDefaults standardUserDefaults] setObject:[user valueForKey:@"name"] forKey:@"name"];
        [[NSUserDefaults standardUserDefaults] setObject:[user valueForKey:@"id"] forKey:@"id"];
        [[NSUserDefaults standardUserDefaults] setObject:[user valueForKey:@"weight"] forKey:@"height"];
        [[NSUserDefaults standardUserDefaults] setObject:[user valueForKey:@"age"] forKey:@"age"];
        //NSLog(@"flag=%i",flag);
    
        break;
    }
    
    }
    NSString *loginfb2 = @"Log in";
    NSLog(@"flag=%i",flag);
    if (flag==0 && !(loginfb != loginfb2)) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alto" message:@"No estas registrado o loggeado, verifica tus datos" delegate:self cancelButtonTitle:@"Adios" otherButtonTitles:nil, nil];
        [alert show];
        [self viewDidLoad];
    } else {
        UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
        [self presentViewController:tabBarController animated:YES completion:nil];
        //Set user defaults
        [[NSUserDefaults standardUserDefaults] setObject:username.text forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setObject:password.text forKey:@"password"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    ToSave:
        [[NSUserDefaults standardUserDefaults] setObject:@"alreadyLogin" forKey:@"loginStatus"];
        
        //NSLog(@"username: %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"username"]);
        //NSLog(@"password: %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"password"]);
        
      
        
    }
    
    

    
    
    
    if(loginfb != loginfb2 ){
        UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
        [self presentViewController:tabBarController animated:YES completion:nil];
        
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (textField == username) {
        [password becomeFirstResponder];
    } else if (textField == password) {

    int i;
    int flag=0;
    for (i=0; i<[myUsers count]; i++) {
        
        NSDictionary *user = [[myUsers objectAtIndex:i] valueForKey:@"User"];
        
        
        if ([username.text isEqualToString:[user valueForKey:@"username"]] &&
            [password.text isEqualToString:[user valueForKey:@"password"]]) {
            
            flag=1;
            //NSLog(@"flag=%i",flag);
            break;
        }
        
    }
    NSLog(@"flag=%i",flag);
    if (flag==0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alto" message:@"No estas registrado, verifica tus datos" delegate:self cancelButtonTitle:@"Adios" otherButtonTitles:nil, nil];
        [alert show];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bienvenido"
                                                        message:[NSString stringWithFormat:@"Hola %@", username.text]
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
        
        //Set user defaults
        [[NSUserDefaults standardUserDefaults] setObject:username.text forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setObject:password.text forKey:@"password"];
        [[NSUserDefaults standardUserDefaults] synchronize];
               [alert show];
        
    }
    }
    return true;
}

- (IBAction)reg:(id)sender {
    
        //Instantiate blue controller
        newViewController *blue = [self.storyboard instantiateViewControllerWithIdentifier:@"newController"];
        //perform transition
        [self presentViewController:blue animated:YES completion:nil];

    
}

- (IBAction)forgot:(id)sender {
    ForgotPassViewController *forgotPass = [self.storyboard instantiateViewControllerWithIdentifier:@"forgotView"];
    //perform transition
    [self presentViewController:forgotPass animated:YES completion:nil];
    
}

- (IBAction)rememberMe:(id)sender {

    if (rememberMeOutlet.on) {
        remember=true;
        
    }else{
        remember=false;
    }
    NSLog(remember ? @"true" : @"false");
ToSave:
    [[NSUserDefaults standardUserDefaults] setBool:remember forKey:@"remember"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [webData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [webData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSError *error;
    NSDictionary *response = [NSJSONSerialization JSONObjectWithData:webData options:kNilOptions error:&error];
    myUsers = [response valueForKey:@"users"];
    //NSLog(@"%@",response);
    
}

- (IBAction)dismissKeyboar:(id)sender{
    [username resignFirstResponder];
    [password resignFirstResponder];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    NSString *mensaje;
    switch (result)
    {
        case MFMailComposeResultCancelled: mensaje = @"Se ha cancelado.";
            break;
        case MFMailComposeResultSaved: mensaje = @"El correo electrónico ha sido guardado.";
            break;
        case MFMailComposeResultSent: mensaje = @"El correo electrónico ha sido enviado correctamente.";
            break;
        case MFMailComposeResultFailed: mensaje = @"Algo ha fallado.";
            break;
        default:
            break;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Untitled.es"
                                                    message:mensaje
                                                   delegate:self
                                          cancelButtonTitle:@"Aceptar"
                                          otherButtonTitles: nil];
    [alert show];
    [self dismissModalViewControllerAnimated:YES];
}

-(void) firstTimeLoggedInFB{
    if(firstRegister==nil && backButtonPressed==false ){
        newViewController *blue = [self.storyboard instantiateViewControllerWithIdentifier:@"newController"];
        //perform transition
        [self presentViewController:blue animated:YES completion:nil];
        
        
    }
    else if ([jj isEqualToString:@"alreadyLogin"]) {
        UITabBarController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
        [self presentViewController:tabBarController animated:YES completion:nil];
        //NSLog(@"ya se habia logueado");
    }

}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch * touch = [touches anyObject];
    if(touch.phase == UITouchPhaseBegan) {
        [self.password resignFirstResponder];
        [self.username resignFirstResponder];
      
    }

        
    
}




@end
