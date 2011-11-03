<?php
 include_once "variables.php";
 include_once "database.php";

/**
 * @link: http://www.Awcore.com/dev
 */

//make sure user is valid
if(check_ses_vars() != '') {
    
   function pagination($query, $per_page = 10,$page = 1, $url = '?'){        
        $query = "SELECT COUNT(*) as `num` FROM {$query}";

        $db = Database::get();
        $row = $db->query($query);
        $row = $row[0];

        $total = $row['num'];
        $adjacents = "2"; 
 
        $page = ($page == 0 ? 1 : $page);  
        $start = ($page - 1) * $per_page;                               
         
        $prev = $page - 1;                          
        $next = $page + 1;
        $lastpage = ceil($total/$per_page);
        $lpm1 = $lastpage - 1;

        $pagination = "";
        if($lastpage > 1)
        {   
            $pagination .= "<ul class='pagination'>";
                    $pagination .= "<li class='details'>Page $page of $lastpage</li>";
            if ($lastpage < 7 + ($adjacents * 2))
            {   
                for ($counter = 1; $counter <= $lastpage; $counter++)
                {
                    if ($counter == $page)
                        $pagination.= "<li><a class='current'>$counter</a></li>";
                    else
                        $pagination.= "<li><a href='#'>$counter</a></li>";                    
                }
            }
            elseif($lastpage > 5 + ($adjacents * 2))
            {
                if($page < 1 + ($adjacents * 2))     
                {
                    for ($counter = 1; $counter < 4 + ($adjacents * 2); $counter++)
                    {
                        if ($counter == $page)
                            $pagination.= "<li><a class='current'>$counter</a></li>";
                        else
                            $pagination.= "<li><a href='#'>$counter</a></li>";                    
                    }
                    $pagination.= "<li class='dot'>...</li>";
                    $pagination.= "<li><a href='#'>$lpm1</a></li>";
                    $pagination.= "<li class='last'><a href='#'>$lastpage</a></li>";      
                }
                elseif($lastpage - ($adjacents * 2) > $page && $page > ($adjacents * 2))
                {
                    $pagination.= "<li><a href='#'>1</a></li>";
                    $pagination.= "<li><a href='#'>2</a></li>";
                    $pagination.= "<li class='dot'>...</li>";
                    for ($counter = $page - $adjacents; $counter <= $page + $adjacents; $counter++)
                    {
                        if ($counter == $page)
                            $pagination.= "<li><a class='current'>$counter</a></li>";
                        else
                            $pagination.= "<li><a href='#'>$counter</a></li>";                    
                    }
                    $pagination.= "<li class='dot'>..</li>";
                    $pagination.= "<li><a href='#'>$lpm1</a></li>";
                    $pagination.= "<li class='last'><a href='#'>$lastpage</a></li>";      
                }
                else
                {
                    $pagination.= "<li><a href='#'>1</a></li>";
                    $pagination.= "<li><a href='#'>2</a></li>";
                    $pagination.= "<li class='dot'>..</li>";
                    for ($counter = $lastpage - (2 + ($adjacents * 2)); $counter <= $lastpage; $counter++)
                    {
                        if ($counter == $page)
                            $pagination.= "<li><a class='current'>$counter</a></li>";
                        else
                            $pagination.= "<li><a href='#'>$counter</a></li>";                    
                    }
                }
            }
             
            if ($page < $counter - 1){ 
                //$pagination.= "<li><a href='#'>Next</a></li>";
                //$pagination.= "<li><a href='#'>Last</a></li>";
            }else{
                //$pagination.= "<li class='next-button'><a class='current'>Next</a></li>";
                //$pagination.= "<li class='last-button'><a class='current'>Last</a></li>";
            }
            $pagination.= "</ul>\n";      
        }
        $pagination .= "<script>
                $(document).ready( function() {
                    $('.pagination li').click( function() {
                        $(this).addClass('selected');
                        update();
                    });                    
                });
            </script>
        ";
        return $pagination;
    } 
}//user check
?>