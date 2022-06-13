// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:nftview/provider/nft_provider.dart';
import 'package:provider/provider.dart';

class NFTScreen extends StatefulWidget {
  const NFTScreen({Key? key}) : super(key: key);

  @override
  State<NFTScreen> createState() => _NFTScreenState();
}

class _NFTScreenState extends State<NFTScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('NFT View')),
        body: Consumer<NFTProvider>(builder: (context, provider, _) {
          return ListView.builder(
              itemCount: provider.nftModel.data?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          provider.nftModel.data![index].imageLink!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        provider.nftModel.data![index].name!,
                        style: const TextStyle(fontSize: 24),
                      ),
                      Text(provider.nftModel.data![index].description!)
                    ],
                  ),
                );
              });
        }));
  }
}
