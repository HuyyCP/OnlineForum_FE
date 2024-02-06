// contains backend ip, port
class Config {
  static const String apiURL = "192.168.1.16:4367";
}

//  Container(
//                     child: Row(
//                       children: [
//                         TextFormField(
//                             controller: messageController,
//                             decoration: const InputDecoration(
//                               hintText: "Comment here",
//                             )
//                         ),
//                         IconButton(
//                           onPressed: () async {
//                               await CommentAPIService.addComment(messageController.text, snapshot.data!.idpost);
//                               setState(() {
                                
//                               });
//                           }, 
//                           icon: const Icon(
//                             Icons.send,
//                             color: Colors.blue,
//                           )
//                         )
//                       ],
//                     ),
//                   )