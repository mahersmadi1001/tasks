import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_packegs/blocs/local_search_product_bloc/local_search_product_bloc.dart';
import 'package:test_packegs/view/home_view.dart';
class SearchView extends StatefulWidget {
  final String initialQuery; // استقبال النص من الصفحة السابقة
  const SearchView({super.key, required this.initialQuery});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialQuery);
    
    context.read<LocalSearchProductBloc>().add(
      SearchEvent(query: widget.initialQuery),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
           
                context.read<LocalSearchProductBloc>().add(SearchEvent(query: value));
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color(0xffF9FAFB),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          
         
          Expanded(
            child: BlocBuilder<LocalSearchProductBloc, LocalSearchProductState>(
              builder: (context, state) {
                if (state is LocalSuccess) {
                  return state.products.isEmpty 
                    ? Haserror() 
                    : ListView.builder(
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(state.products[index].title),
                            leading: CircleAvatar(child: Text(state.products[index].id.toString())),
                          );
                        },
                      );
                } else if (state is LocalError) {
                  return const Center(child: Text("Error occurred"));
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }

 
 
}
 class Haserror extends StatelessWidget {
  const Haserror({super.key});

  @override
  Widget build(BuildContext context) {
   
    return   Column(
              children: [
              
                SizedBox(height: 150),
                Icon(Icons.search, size: 100, color: Color(0xffB3B3B3)),
                Text(
                  'No Results Found!',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(
                  width: 252,
                  child: Text(
                    'Try a similar word or something more general.',
                    style: TextStyle(
                      color: Color(0xff808080),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
  }
  
}