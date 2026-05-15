--test whether the parent snippet has content from a visual selection. If yes, put into a text  node, if no then start an insert node
local visualSelectionOrInsert = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, t( parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

return {

    s({trig="ONCE", snippetType="snippet", desc="modern pragma once header guard"},
        fmt(
            [[
            #pragma once

            <>
            ]],
            { i(0) },
            { delimiters = "<>" }
        )
    ),
    s({trig="CLASS",snippetType="snippet",desc="set up a blank class"},
        fmt(
            [[
            /*!
            This class...
            */
            class <>
                {
                public:
                    <>
                };
            ]],
            { i(1,"className"), i(0) },
            { delimiters = "<>"}
        )
    ),

    s({trig="cmt",snippetType="snippet",desc="set up a quick doxygen comment block"},
        fmt(
            [[
                /*!
                <>
                */
                ]],
            { i(1) },
            { delimiters = "<>"}
        )
    ),

    s({trig="maincpp", snippetType="snippet", dscr="set up a bare-bones int main with some includes"},
        fmt(
            [[
            #include <cmath>
            #include <iostream>
            #include <fstream>
            #include <sstream>
            #include <iomanip>

            int main(int argc, char*argv[])
            {
                int c;

                double x = 0.0;
                while((c=getopt(argc,argv,"n:")) != -1)
                    switch(c)
                        {
                        case 'n': x = atof(optarg); break;
                        case '?':
                            if(optopt=='c')
                                std::cerr<<"Option -" << optopt << "requires an argument.\n";
                            else if(isprint(optopt))
                                std::cerr<<"Unknown option '-" << optopt << "'.\n";
                            else
                                std::cerr << "Unknown option character.\n";
                            return 1;
                        default:
                           abort();
                        };
                printf("x = %f\n",x);
                89

                return 0;
            };
            ]],
            { i(1) },
            { delimiters = "89"}
        )
    ),


}
