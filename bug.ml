let alloc () =
  for i = 0 to 20000 do
    for i = 0 to 200; do ignore (Array.make 10 ()) done;
    ignore (Array.make 1000 ());
    if i mod 1000 = 0 then (Gc.compact ());
  done

let churn () =
  let allocators = List.init 10 (fun _ -> Thread.create alloc ()) in
  List.iter Thread.join allocators

let () = churn ()
