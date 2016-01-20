<?PHP

$data = array('user_name'=>'Ielow Me','points'=>1200,'status'=>'active');
header('Content-Type: application/json');
echo json_encode($data);