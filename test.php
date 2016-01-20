<?PHP
$user1 =array('user_name'=>'Ielow Me','points'=>1200,'status'=>'active');
$user2 =array('user_name'=>'Zero','points'=>0,'status'=>'inactive');

$data['users']= array($user1,$user2);
header('Content-Type: application/json');
echo json_encode($data);