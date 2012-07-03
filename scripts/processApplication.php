<?PHP

include_once '../lib/variables.php';
include_once '../lib/database.php';
include_once '../lib/core.php';

$db = Database::get();

$query = "UPDATE applicant_academic SET status = '{$_POST['status']}' WHERE applicant_id = '{$_POST['id']}'";

$db->iquery($query);

?>