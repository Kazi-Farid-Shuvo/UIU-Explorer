<?php
require_once 'functions.php';
//for creating new clubs
function createClubs($data, $imagedata){
    global $db;
        $club_name = mysqli_real_escape_string($db,$data['club_name']);
        $email = mysqli_real_escape_string($db,$data['email']);
        $club_description = mysqli_real_escape_string($db,$data['club_description']);


        $profile_pic="";
        if($imagedata['name']){
            $image_name = time().basename($imagedata['name']);
            $image_dir="../images/club_profile/$image_name";
            move_uploaded_file($imagedata['tmp_name'],$image_dir);
            $profile_pic=", profile_pic='$image_name'";
        }
       
      
    
        $query = "UPDATE users SET club_name = '$club_name', email='$email',club_description='$club_description', $profile_pic WHERE id=".$_SESSION['userdata']['id'];
        return mysqli_query($db,$query);
   }

//for checking the user is followed by current user or not+++
function checkClubFollowStatus($club_id){
    global $db;
    $current_user = $_SESSION['userdata']['id'];
    $query="SELECT count(*) as row FROM club_follow_list WHERE user_id=$current_user && club_id=$club_id";
    $run = mysqli_query($db,$query);
    return mysqli_fetch_assoc($run)['row'];
}

//for checking duplicate club
function isClubNameRegistered($club_name){
    global $db;
    $query="SELECT count(*) as row FROM clubs WHERE club_name='$club_name'";
    $run=mysqli_query($db,$query);
    $return_data = mysqli_fetch_assoc($run);
    return $return_data['row'];
}

//for checking duplicate club_name by other
function isClubNameRegisteredByOther($club_name){
    global $db;
    $club_id=$_SESSION['userdata']['id'];
    $query="SELECT count(*) as row FROM users WHERE username='$club_name' && id!=$club_id";
    $run=mysqli_query($db,$query);
    $return_data = mysqli_fetch_assoc($run);
    return $return_data['row'];
}

//for checking duplicate email
function isGroupEmailRegistered($email){
    global $db;
    $query="SELECT count(*) as row FROM clubs WHERE email='$email'";
    $run=mysqli_query($db,$query);
    $return_data = mysqli_fetch_assoc($run);
    return $return_data['row'];
}

//Group signup form
function validateGroupSignupForm($form_data){
    $response=array();
    $response['status']=true;
      
       
       
        if(!$form_data['club_name']){
            $response['msg']="Club name is not given";
            $response['status']=false;
            $response['field']='club_name';
        }
        
        if(!$form_data['email']){
            $response['msg']="Email is not given";
            $response['status']=false;
            $response['field']='email';
        }
        
        if(!$form_data['club_description']){
            $response['msg']="Club description name is not given";
            $response['status']=false;
            $response['field']='club_description';
        }
        if(isGroupEmailRegistered($form_data['email'])){
            $response['msg']="email id is already registered";
            $response['status']=false;
            $response['field']='email';
        }
        if(isClubNameRegistered($form_data['club_name'])){
            $response['msg']="club name is already registered";
            $response['status']=false;
            $response['field']='club_name';
        }
    
        return $response;
    
    }


//for validating update form
function validateClubUpdateForm($form_data,$image_data){
    $response=array();
    $response['status']=true;
      

        if(!$form_data['club_name']){
            $response['msg']="club name is not given";
            $response['status']=false;
            $response['field']='username';
        }
        
        if(!$form_data['email']){
            $response['msg']="email is not given";
            $response['status']=false;
            $response['field']='last_name';
        }
        if(!$form_data['club_description']){
            $response['msg']="club description is not given";
            $response['status']=false;
            $response['field']='club_description';
        }
  
        if(isClubNameRegisteredByOther($form_data['club_name'])){
            $response['msg']=$form_data['club_name']." is already registered";
            $response['status']=false;
            $response['field']='club';
        }
    
       if($image_data['name']){
           $image = basename($image_data['name']);
           $type = strtolower(pathinfo($image,PATHINFO_EXTENSION));
           $size = $image_data['size']/1000;//converting byte to kb

           if($type!='jpg' && $type!='jpeg' && $type!='png'){
            $response['msg']="only jpg,jpeg,png images are allowed";
            $response['status']=false;
            $response['field']='profile_pic';
        }

        if($size>1000){
            $response['msg']="upload image less then 1 mb";
            $response['status']=false;
            $response['field']='profile_pic';
        }
       }

        return $response;
    
    }
    //edit/update club info
    function updateClubProfile($data,$imagedata){
        global $db;
        $club_name = mysqli_real_escape_string($db,$data['club_name']);
        $email = mysqli_real_escape_string($db,$data['email']);
        $club_description = mysqli_real_escape_string($db,$data['club_description']);


        $profile_pic="";
        if($imagedata['name']){
            $image_name = time().basename($imagedata['name']);
            $image_dir="../images/club_profile/$image_name";
            move_uploaded_file($imagedata['tmp_name'],$image_dir);
            $profile_pic=", profile_pic='$image_name'";
        }
       
      
    
        $query = "UPDATE users SET club_name = '$club_name', email='$email',club_description='$club_description', $profile_pic WHERE id=".$_SESSION['userdata']['id'];
        return mysqli_query($db,$query);

    }

    //for getting clubdata by id
    function getClub($club_id){
        global $db;
    $query = "SELECT * FROM clubs WHERE id=$club_id";
    $run = mysqli_query($db,$query);
    return mysqli_fetch_assoc($run);

    }

    //for get all cubs
    function getAllClubsCount(){
    global $db;
    $query="SELECT count(*) as row FROM clubs";
    $run = mysqli_query($db,$query);
    return mysqli_fetch_assoc($run)['row'];
    }

    //for getting users for follow suggestions++
    function getClubFollowSuggestions(){
        global $db;

        $club_id = $_SESSION['userdata']['id'];
        $query = "SELECT * FROM users WHERE id!=$club_id";
        $run = mysqli_query($db,$query);
        return mysqli_fetch_all($run,true);
    }

    //follow club +++
    function followClub($club_id){
        global $db;
        // $cu = getUser($_SESSION['userdata']['id']);
        $user_id=$_SESSION['userdata']['id'];
        $query="INSERT INTO club_follow_list(club_id,user_id) VALUES($club_id,$user_id)";
        return mysqli_query($db,$query);
        
    } 

     //for filtering the club suggestion list
     function filterClubFollowSuggestion(){
        $list = getClubFollowSuggestions();
        $filter_list  = array();
        foreach($list as $user){
            if(!checkFollowStatus($user['id']) && !checkBS($user['id']) && count($filter_list)<5){
             $filter_list[]=$user;
            }
        }
        
        return $filter_list;
        }



























?>