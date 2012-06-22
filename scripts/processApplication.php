<?PHP

include_once '../lib/variables.php';
include_once '../lib/database.php';
include_once '../lib/core.php';

$db = Database::get();

$query = "UPDATE applicant_academic SET status = %s WHERE applicant_id = %s";

$db->iquery($query, $_POST['status'], $_POST['id']);

?>